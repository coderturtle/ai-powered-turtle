

# Cross-Cloud Resiliency Proposal (AWS→Azure)

**Executive Summary:** We propose building a minimal active–passive backup of the core investing platform in Azure, mirroring our AWS architecture with function‐and‐container compute, equivalent database and messaging services, and data feeds. This “two-cloud” approach can improve availability if one cloud fails, but it also greatly increases engineering complexity and cost. In Azure we would use Azure Functions (for Lambda), Azure Kubernetes Service or Container Instances (for ECS/EKS), Cosmos DB (for DynamoDB), Azure Database for PostgreSQL (for Aurora Postgres), Event Hubs (for Kinesis), and Service Bus/Queue Storage (for SQS). We must implement near-real-time data replication (e.g. streaming Kinesis data into Event Hubs and on into our data lake) and daily batch sync of the vendor feed (via Azure Data Factory or Logic Apps). The design must emphasize GDPR and FCA compliance – e.g. by using Azure’s UK/EU regions and its ISO 27001/SOC 2 certifications.

Two failover strategies are considered. _Option A (Cold Standby)_ keeps only backups (e.g. storage) in Azure and builds all services on-demand during a failover. This minimizes steady-state cost but means higher RTO (recovery time) when switching to Azure. _Option B (Warm Standby)_ keeps the entire Azure environment provisioned (though scaled down or de‑allocated) so that failover is quick; however it incurs ongoing cost to maintain idle resources. We also outline the extra engineering overhead: dual CI/CD pipelines, duplicated infrastructure-as-code, replicated identity (Azure AD vs AWS IAM), separate secrets stores (Key Vault vs Secrets Manager), and unified observability. For example, Azure Monitor (with Azure Arc) can ingest metrics and logs from AWS EC2/EKS as well as Azure, enabling one pane of glass across both clouds.

Finally, we analyze dependencies and risks. The third-party record-keeper remains a single point outside our control: its outages or API issues cannot be mitigated by multi-cloud alone. We recommend building _anti-corruption/adaptor layers_ and event-driven replication to isolate our services from the vendor. For instance, using an ACL pattern (a façade service) between our domain and the vendor API ensures our codebase is not “corrupted” by the vendor’s data model. (AWS notes that an ACL introduces extra operational overhead – e.g. for monitoring and CI/CD – but decouples systems and prevents our design from degrading.) We also consider shadow‑write or event-sourcing techniques (e.g. simultaneously writing order data into our own data lake or Cosmos DB) so we retain a local copy of critical user data if the vendor is down.

The report includes a RACI matrix for key dependencies, a qualitative “within vs outside control” risk analysis, and a cost estimate by category (infrastructure, data sync, DevOps, observability, overhead) for both cold- and warm-standby options.

## Azure Equivalents to AWS Services

To mirror our AWS platform in Azure, we would use the following analogous services:

- **Compute (serverless/containers):** AWS Lambda functions become **Azure Functions**; AWS ECS/EKS containers map to **Azure Kubernetes Service (AKS)** or **Azure Container Instances** (for simple container tasks). Microsoft’s migration guides explicitly map Lambda concepts to Azure Functions (consumption/Flex plan).
    
- **Databases:** AWS DynamoDB (NoSQL key-value) and DocumentDB correspond to **Azure Cosmos DB**, a global multi-model (key-value, document, graph) database. Amazon Aurora (Postgres) and RDS map to **Azure Database for PostgreSQL** (a managed Postgres service). Azure also has equivalent managed MySQL and SQL Server services, but we focus on PostgreSQL for Aurora.
    
- **Storage:** S3 would become **Azure Blob Storage** or **Data Lake Storage**. (We’d encrypt blobs at rest and restrict region locations per GDPR/FCA.)
    
- **Streaming & Messaging:** Amazon Kinesis (data streams) would be replaced by **Azure Event Hubs** (high-throughput event ingestor). AWS SQS queues map to Azure **Queue Storage** or **Service Bus queues/topics**. (For example, AWS SQS provides a managed queueing service; in Azure this is handled by either the simpler Storage Queue or the more feature-rich Service Bus messaging system.) SNS (pub/sub) maps to Azure Event Grid or Service Bus Topics.
    
- **Networking:** The user’s mention of “CloudBridge” (likely a VPN/Direct Connect analog) suggests we’d use **Azure ExpressRoute** or **site-to-site VPN** to securely link on-premises or other clouds to Azure.
    

No high-level PaaS (e.g. App Services) would be used, per requirements. All resources would be defined via IaC (Terraform or ARM/Bicep), enabling automated, repeatable deployment in Azure that mirrors the AWS IaC.

## Data Backup and Synchronization

We would implement **dual synchronization pipelines** to keep Azure updated:

- **Near-real-time sync:** We can stream transaction and telemetry data from AWS to Azure. For example, AWS Kinesis Data Streams (or DynamoDB Streams) can be bridged into Azure Event Hubs (using built-in connectors or a small bridging function). From Event Hubs we can route events into an Azure data pipeline (e.g. Azure Stream Analytics or Functions) and land them in Cosmos DB or Azure SQL. This provides a live mirror of critical data. Azure Monitor (via Azure Arc) can even ingest AWS metrics and logs, so we would see cross-cloud telemetry in one place.
    
- **Daily batch sync:** Each night, we ingest the vendor’s CSV/FTP data feed into Azure. This can be done with Azure Data Factory or Logic Apps: for example, a Data Factory pipeline connects to the vendor’s SFTP feed, transforms the file, and writes the results into an Azure SQL/Blob/Cosmos store. All data flows would use encryption in transit (TLS) and at rest (customer-managed keys or Azure-managed keys) to meet **GDPR** requirements. Both AWS and Azure are certified for GDPR data protection (Azure complies with ISO 27001/27018, which cover data privacy controls). Crucially, Azure also holds financial regulatory certifications (e.g. FCA/PRA for UK), so storing UK-investor data in Azure is permissible under FCA rules.
    

Both pipelines (real-time and batch) need monitoring and alerts. We’d define idempotent load operations and reconciliation checks. (For example, if a batch load fails, we keep the AWS data available as a stale cache until issues are resolved.) All these designs must also respect data residency: we’d use Azure regions in the UK/EU so that the third-party personal data never leaves compliant geographies.

## Active–Passive Deployment Options

We consider two models:

- **Option A – Cold Standby:** No Azure compute or DB is running day-to-day. We only maintain backups (e.g. blob snapshots, database backups, or managed backup vaults). In a failover, we **deploy everything via IaC** from scratch (using Terraform/ARM templates) and restore from backups. This minimizes cost ($0-$ runs in Azure until needed) but means a longer downtime while the environment spins up.
    
- **Option B – Warm Standby:** The full Azure infrastructure is _provisioned in advance_ but scaled to zero or deallocated. For example, VMs or app services exist in Resource Groups but are turned off, Azure Function apps are “warm” but idle, etc. This incurs a continuous cost for reserved resources (some storage/compute reservation fees) but allows much faster failover (the services can simply be started or scaled up).
    

In both cases the design is “passive” in that only AWS runs actively; Azure is the DR site. We would automate the failover switch (manual approval plus script) and ensure DNS/traffic is redirected. Importantly, our backups (in both clouds) must be cross-synced: for example, daily database dumps from the third-party vendor should be stored in both AWS and Azure. Table 1 below outlines trade-offs:

|Strategy|Description|Pros|Cons|
|---|---|---|---|
|**Cold (A)**|Azure infra _not running_ (built on demand)|Minimal steady cost; simpler to maintain|Slow recovery (need to provision on failover); risk of IaC drift|
|**Warm (B)**|Azure infra _deployed but idle_ (powered off)|Fast failover; environment already built|Higher recurring cost (idle resources); more ops work to keep synchronized|

In either option we would use automation (Terraform/ARM) to ensure parity. For example, “Azure Blueprints” and “Azure DevOps multi-stage pipelines” would mirror our AWS CloudFormation/CodePipeline. Failover runbooks and periodic failover drills would also be implemented. Note that Azure allows “stopping” VMs to incur only storage charges (no compute), which helps warm standby cost.

## Engineering Complexity & DevOps Overhead

Moving to multi-cloud greatly increases complexity:

- **Multi-Cloud CI/CD:** We must maintain _two sets_ of pipelines. Our current AWS deployments (CodePipeline, CloudFormation) must be duplicated or extended to deploy into Azure (Azure DevOps or GitHub Actions, Terraform). This doubles testing and validation work. Any change to a service now needs to be applied in both clouds (code, infra templates, config). Releasing and coordinating dual pipelines is nontrivial.
    
- **Infrastructure as Code:** We would use a common IaC tool (Terraform or cross-cloud ARM + CloudFormation) to define AWS+Azure resources. We must ensure each cloud’s templates stay in sync in terms of configuration (network CIDRs, security settings, IAM roles vs RBAC roles, etc.). For example, an SQS queue plus Lambda chain in AWS needs an equivalent Service Bus queue plus Function in Azure, each defined in code. Keeping both codebases aligned (e.g. parameter names, secrets references) is an ongoing burden.
    
- **Identity & Access:** Azure uses Azure AD with RBAC, while AWS uses IAM. We’d need to replicate our security model in Azure (e.g. “PlatformOperator” roles in Azure mirroring AWS roles). This means configuring Azure AD groups, role assignments, and possibly syncing identities (via Azure AD Connect or Entitlement Management). Secrets and keys must be stored twice (Azure Key Vault vs AWS Secrets Manager), meaning double the rotation and auditing effort.
    
- **Observability & Monitoring:** We must integrate monitoring for both clouds. Azure Monitor (with Azure Arc) can natively collect telemetry from AWS VMs and EKS clusters. For example, installing the Azure Monitor agent on EC2 allows consistent log collection and alerting. We can use Azure Log Analytics as a central store and even ingest AWS CloudWatch logs there. (Note: AWS CloudWatch can also query Azure Monitor metrics, so hybrid solutions are possible.) In practice, we’d set up parallel alert rules in each cloud or use a unified tool (e.g. Datadog or Grafana) with connectors to AWS and Azure. This means double work to configure dashboards, alerts and “health” dashboards.
    
- **Telemetry & Alerting:** Similarly, we need to replicate alerting: CPU, errors, latencies on Lambda/Azure Function must both trigger notifications. Network fallbacks (e.g. Cross-Cloud connectivity health) must be monitored from both sides. Ensuring guardrails (e.g. CloudWatch/Azure Policy compliance checks) run in both clouds doubles the DevOps tasks.
    
- **Long-Term Overhead:** Over time, both clouds will evolve independently. We must track API changes, deprecations, or feature differences in AWS and Azure versions of each service. For example, a new AWS Lambda feature may not exist in Azure Functions, or vice versa. Keeping both architectures in feature-parity is a continuous effort (not a one-time cost).
    

In short, we need duplicate tooling and processes. Microsoft documentation notes that Azure Monitor can “provide complete monitoring for your resources … running in other clouds including AWS”, but “complete” means extra setup. We must also consider compliance controls in both clouds. Azure and AWS each have ISO/IEC certifications, but our teams will need to audit and configure each environment separately (though compliance frameworks are similar). All this adds significant engineering and management overhead, and hence cost.

## Third-Party Vendor Dependency & Decoupling

The third-party record-keeper remains the biggest single dependency, and **its resilience lies outside our control**. If that vendor suffers downtime or a data outage, our cross-cloud design can only partially mitigate (e.g. we may show stale data, but cannot actually onboard new users or execute orders without the vendor). In practice:

- _Outages:_ If the vendor’s system is down, neither AWS nor Azure environments can process new onboarding or trades. We must rely on fallback modes (e.g. read-only stale data, manual procedures) – risk that must be acknowledged. We should engage the vendor on their DR/HA plans.
    
- _Data currency:_ The daily feed only provides end-of-day snapshots. Our system already uses it to display stale info during AWS outages. If we add Azure, we must keep that data feed synchronized there too (so both clouds have the same cached data).
    
- _Model changes:_ If the vendor changes their API or data model, we would need to update both cloud integrations.
    

To reduce coupling, we **recommend implementing an Anti‑Corruption Layer (ACL)** between our services and the vendor. The ACL (an adapter service or façade) translates between the vendor’s domain model and our own. This way, our codebase remains cleanly designed even if the vendor’s model is complex or changes over time. For example, when our app calls `CreateAccount`, the ACL might call the vendor API and then map the vendor’s response into our internal `AccountCreated` event format.

_Figure: Anti-Corruption Layer pattern (Azure Architecture Center). An ACL (orange) sits between our services and the external vendor system, adapting data and decoupling models._

However, ACLs have trade-offs. The AWS guidance notes that an ACL _“requires additional effort to operate and maintain”_ (integration with monitoring, CI/CD, etc.) and itself can become a point of failure. We must ensure it is robust (e.g. add retries, circuit breakers, logging). On the plus side, it prevents “polluting” our domain logic with vendor specifics.

Other decoupling strategies:

- **Event‑driven data lake:** We could replicate or cache vendor events as they happen. If the vendor provides any webhook or pub/sub feed (or even database change feed), we could mirror those into Azure as event data. This would allow our Azure site to build read-models or analytics without calling the vendor in real-time.
    
- **Shadow writes:** For any outbound requests (e.g. placing an order), our system could simultaneously write a copy of that transaction into our own database/lake. This “write-ahead” log means if the vendor later becomes unavailable, we still have a record of intended actions (to reconcile later).
    
- **Data warehouse:** Nightly dumps of vendor data can feed an internal warehouse in Azure (e.g. Synapse or Databricks), so analytics and some operations can proceed even if the live system is down.
    

In all cases, we must be mindful of privacy and licensing: any replicated data must still be handled under GDPR/FCA rules and the vendor’s terms of use.

**In summary:** Key resilience factors outside our control include the vendor’s uptime, their own DR practices, and network connectivity between clouds and the vendor. We can mitigate this by caching, redundancy, and decoupling, but we cannot eliminate the vendor as a dependency. Our architecture and contracts should recognize that.

## RACI and Risk Analysis

To clarify responsibilities and risks, we define roles and tasks as follows (R=Responsible, A=Accountable, C=Consulted, I=Informed):

|Dependency / Task|Responsible (R)|Accountable (A)|Consulted (C)|Informed (I)|
|---|---|---|---|---|
|**Vendor integration** (APIs/onboarding/data feed)|3rd‑party Vendor team|Platform Team Lead|Dev/Infra Teams, Security|Exec, Risk Management|
|**AWS production platform** (maintain ECS/Lambda)|Platform/Infra Team|Ops Manager|Security, Vendor|Exec, Risk Management|
|**Azure standby environment** (build & config)|Infra/DevOps Team|Cloud Ops Lead|Platform, Security|Exec, Risk Management|
|**Data synchronization pipelines** (Kinesis⇄EventHubs, daily feed)|Dev/Eng Integration Team|Dev Lead|Vendor, Database Team|Security, Compliance|
|**Failover & DR procedures** (manual/auto failover)|Infra/DevOps Team|CISO/CTO (Ops lead)|Platform, Vendor|Exec, Risk Management|
|**Security & Compliance** (GDPR/FCA audit)|Security/Compliance Team|CISO|Infra, Platform|Exec, Audit/Risk committees|

**Key risks and mitigations:**

- _Vendor outage:_ Even with multi-cloud, if the vendor platform fails, user onboarding or trades halt. We mitigate with stale‑cache modes and a well-tested manual fallback process. We should also negotiate strict SLAs and require the vendor to have their own DR in place.
    
- _Data sync failure:_ If the streaming or batch pipelines break, data in Azure will lag behind AWS. Mitigation: build idempotent, self-healing pipelines (retries, dead-letter queues) and alerting on sync delays. Regular reconciliation jobs can compare AWS vs Azure data to detect drifts.
    
- _Configuration drift:_ The AWS and Azure environments may diverge if not managed. Mitigation: enforce IaC and periodic audits. Use tools (e.g. HashiCorp Terraform Cloud) to detect drifts between declared and actual state.
    
- _Compliance gaps:_ Ensuring both AWS and Azure meet GDPR/FCA controls doubles audit effort. We will use automated compliance checks (Azure Policy, AWS Config) and third-party CSPM tools for both clouds.
    
- _Multi-cloud network cost:_ Continuous cross-cloud replication (Kinesis↔Event Hubs) may incur egress charges. Mitigation: batch noncritical data and use compression.
    
- _Staffing skills:_ We need Azure expertise in addition to AWS. This training cost and potential human error is a risk; we mitigate by cross-training and possibly hiring Azure-experienced DevOps.
    

**Within vs Outside Control:** We retain control of the architecture, infrastructure, deployment pipelines, and monitoring in both clouds. All cloud-side resiliency (e.g. spinning up extra instances, replicating data between AZs/regions) is under our purview. **Outside our control** are the third‑party vendor’s system availability and data integrity, as well as any internet/VPN connectivity issues. We assume the vendor’s core system is a shared risk: the vendor’s own geography (even if we are on EUV), their internal bugs, and downtime are external. Our design should aim to fail _gracefully_ when the vendor is down (e.g. show cached data, queue user actions), but we cannot avert a total outage caused by the vendor or the global network.

## High-Level Cost Estimate

Below is a _very rough_ cost breakdown by category, for illustration. Actual figures depend on scale and negotiated rates.

|Category|Option A (Cold Standby)|Option B (Warm Standby)|
|---|---|---|
|**Infra Provisioning (one-time)**|~~$100–$200k~~ (setup IaC, templates, testing)|~~$100–$200k~~ (same IaC)|
|**Azure Compute/Storage**|**Minimal** (only backup storage; VMs spun up only during failover)|**Medium–High** (~$X–$Y/month) for idle VMs/Database instances|
|**Data Sync Pipelines**|~~$30–50k~~ (build Event Hub/ADF pipelines) + data ingress costs (~$1–$2k/mo)|~~Same build cost~~ + same monthly costs|
|**DevOps/CI-CD Tooling**|~~$50k~~ (setup multi-cloud pipelines)|~~$50k~~ (plus ~10% extra for maintaining two pipelines)|
|**Observability (Log/Metric)**|~~$20k~~ (initial setup of Azure Monitor, alerts) + volume-based costs (~$Z/mo)|~~Same~~ (we ingest logs from both clouds)|
|**Ongoing Overhead**|~~Lower~~ (managing passive standby)|~~Higher~~ (managing active standby, patching idle VMs)|

- _Infrastructure (one-time):_ We assume 2–3 engineers for 4–6 months to design, build and test the Azure environment in IaC – on the order of $150–$200k.
    
- _Azure Compute/Storage (monthly):_ In Option A, we pay only for backup storage (e.g. blob or managed backup). In Option B, we run, say, 3 small VMs and one small PostgreSQL instance idled. At ~$0.50–$1.00/hour each, plus storage ($\sim$5k–$10k/year overall) – on the order of a few thousand dollars per month.
    
- _Data Sync (monthly):_ Azure Event Hubs and Data Factory incur usage costs. E.g. 1–2 Event Hub units (~~$1500 each/mo) plus Data Factory runs (~~$100–$500).
    
- _DevOps:_ One-time pipeline setup, plus additional maintenance (~10–20% of initial cost/year).
    
- _Monitoring:_ Azure Monitor and Sentinel log ingestion costs depend on data volume. If logging is comparable to AWS usage, assume a few thousand dollars per month.
    
- _Dual-Cloud Ops:_ Maintaining compliance and platform teams across two clouds adds ~10–20% in personnel/contract costs. This overhead is larger in Option B (more infrastructure to test/patch) but exists in both.
    

**Summary:** Option B’s idle resources could add on the order of $30k–$60k per year in Azure compute/storage costs (varying by size and idle durations). Option A avoids those steady costs but trades it for slower recovery. Both options incur ~$0.2M initial build costs (shared), plus ongoing pipeline and monitoring expenses.

## Recommendations

Based on this analysis, key recommendations are:

- **MVP Focus:** Build only core components in Azure at first (order processing, user accounts, data sync). Defer peripheral features. Use Azure Functions and AKS to match our current serverless/container architecture.
    
- **Cold Standby (Option A) First:** Given cost sensitivity, we suggest starting with a **cold‑standby model**. Develop full IaC scripts so the entire environment can be provisioned on demand. This shows feasibility with minimal expense.
    
- **Decouple from Vendor:** Immediately implement an anti-corruption layer and local data caching for the vendor integration. This reduces our coupling and lays groundwork for eventual migration (if ever) away from the vendor system.
    
- **Unified DevOps:** Use a single IaC codebase (Terraform with `for_each` or multi-provider modules, or cross-platform frameworks) to reduce duplication. Adopt Azure DevOps or GitHub Actions to manage deployments to both clouds from one pipeline definition, where possible.
    
- **Centralized Observability:** Leverage Azure Monitor/Azure Arc to ingest both AWS and Azure telemetry. Use consistent dashboards (e.g. Grafana with Azure Monitor plugin) so that the support team can monitor either environment uniformly.
    
- **Governance:** Enforce strict security policies in both clouds (e.g. Azure Policy and AWS Config rules for encryption, networking). Align on encryption keys (Azure Key Vault + AWS KMS/HSM) and audit logging (Azure Sentinel + AWS CloudTrail).
    
- **Cross-Cloud Networking:** Evaluate a dedicated interconnect (ExpressRoute + Direct Connect) or VPN for low-latency links between AWS and Azure, since continuous data streaming could incur high egress costs.
    
- **Drills and Testing:** Regularly test failover to Azure (at least annually) to validate RTO. Update runbooks based on lessons learned.
    

In conclusion, multi-cloud DR can improve availability but at significant complexity and cost. Our proposal minimizes service changes by using “like‑for‑like” Azure services, adds robust data replication, and implements architectural patterns (ACL, event sourcing) to insulate against third-party outages. This comprehensive plan balances resilience goals with compliance and cost considerations, giving senior management and security/risk stakeholders a clear roadmap.

**Sources:** Industry and vendor documentation on Azure vs AWS service mappings, Azure compliance certifications, Azure Monitor multi-cloud guidance, and cloud architectural best-practice patterns were used to inform this analysis.