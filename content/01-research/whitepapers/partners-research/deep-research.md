---
title: "Partnership-Ready Technology in the Agentic Financial Services Era"
tags: [architecture, fintech, partnerships, agentic-ai, open-banking, api-strategy, identity]
aliases: ["Partner Readiness Research", "Capability Access Plane", "Agentic Partnerships"]
created: 2026-08-31
updated: 2026-08-31
---

# Partnership-Ready Technology in the Agentic Financial Services Era

## Executive research synthesis

The research supports the core hypothesis, but with an important refinement. A **partnership-ready financial institution is not principally an institution with good APIs**. It is an institution whose useful business capabilities can be made externally consumable without repeatedly reconstructing the surrounding technology, identity, control, data, operational and assurance environment for every new partner.

The distinction matters. An API can expose a tightly coupled internal process, require bespoke credentials, depend on undocumented semantics, have no realistic sandbox, change without an external compatibility contract and require a manual security review before every connection. Such an institution is API-enabled but not meaningfully partnership ready. Conversely, a capability that is separated from a particular channel, has a stable contract, authoritative data semantics, reusable identity and permissioning, automated policy enforcement, external SLOs, lifecycle management, telemetry and a supported onboarding path is much closer to being a **technology product that can participate in an ecosystem**.

The UK's experience with Open Banking provides unusually strong empirical support for this distinction. Its ecosystem is not merely a collection of REST endpoints: it combines common interface standards, a security profile, a participant directory, identity and certificate management, governance, customer-experience expectations and operational performance measurement. The Open Banking Directory explicitly manages identities for organisations and natural persons and certificate lifecycle, while FAPI provides the high-security OAuth profile underlying financial-grade API access. By 30 July 2026, UK Open Banking had passed one billion cumulative payments and 100 billion API calls across the CMA9; monthly API traffic reached 2.81 billion calls in June. This is important evidence that ecosystem scale emerges from **standardised access, trust and operating infrastructure around APIs**, rather than from APIs alone.

That suggests a better definition:

> **Partnership-ready technology is the ability to expose an appropriate business capability, data product or workflow to an approved external consumer through a reusable access, authority, control and operating model, with low partner-specific engineering.**

The most important architectural shift is therefore from **integration-first to capability-first thinking**. The design question becomes less "what API does this partner require?" and more "what business capability are we prepared to support independently of our own channel, under what contract and authority, and through which interfaces can it be consumed?" An account-opening capability, for example, might ultimately be invoked from the institution's app, a partner's embedded journey, an adviser platform or an authorised agent. Its business rules should not need to be recreated for each. Stripe's embedded Connect onboarding illustrates the pattern outside traditional banking: requirements are exposed through its Accounts model and Stripe can generate and maintain the verification experience, rather than each platform independently reproducing changing identity-verification logic. Adyen similarly externalises not just payment endpoints but onboarding, verification, balance structures, payment splitting and payouts as reusable platform capabilities.

This research consequently finds that **identity and authority are likely to be a bigger hidden constraint than API technology**. Many financial-services estates still implicitly conflate several questions: who is the customer; who has authenticated; which organisation does the caller belong to; which software is making the request; what is that software allowed to do; who authorised the action; and whether that authority can be delegated. Those distinctions become unavoidable in B2B2C and agentic models. Open Banking already separates participant identity and software/certificate trust from customer authorisation, while FAPI 2.0 provides a finalised high-security OAuth profile. The technology foundations are therefore substantially available today for human-to-software and relatively simple delegated access.

What is not mature is **arbitrary multi-hop agent delegation across organisational boundaries**. As of August 2026, IETF work explicitly identifies gaps in standard ways of carrying and attenuating authority through multi-hop agent chains; proposed approaches for agent-specific OAuth profiles and delegation chains remain Internet-Drafts, not settled standards. That distinction is strategically important. An institution should not wait for a new "agent identity stack" before becoming agent ready. It should strengthen today's identity, workload identity, OAuth/FAPI, fine-grained authorisation and evidence capabilities while keeping emerging agent-specific protocols at the edge.

The same conclusion applies to MCP and A2A. Both have moved well beyond curiosity. The July 2026 MCP specification uses established OAuth discovery mechanisms, including OAuth Protected Resource Metadata, for protected resources. A2A v1.0 shipped in March 2026 with Agent Cards for capability discovery and support for cryptographically signed Agent Cards; the specification defines identity/capability metadata and standard discovery mechanisms. These are increasingly credible **interoperability mechanisms**. They are not, however, substitutes for a financial institution's customer identity, regulatory permissions, consent, transaction controls, fraud decisioning or evidential record. MCP can tell an agent how to invoke a tool; it does not decide whether an adviser agent is legally and operationally permitted to switch a client's pension.

This leads to a second major conclusion: the agentic era changes **discovery, delegation and evidence more fundamentally than transport**.

Financial institutions have traditionally designed products for two software-consumption modes: humans navigate a graphical journey, or pre-integrated applications call predefined APIs. An agent introduces a consumer that may first need to **discover** what the institution offers, interpret machine-readable eligibility and pricing, determine an appropriate action, acquire narrowly scoped authority, execute it and produce evidence connecting the eventual transaction to the original person's intent. A2A's Agent Card, MCP's structured tools and the Agentic Commerce Protocol's structured catalogue model all point towards machine-readable discovery becoming part of distribution infrastructure.

Payments provide an early view of the corresponding trust model. Visa Intelligent Commerce provisions agent-specific payment tokens and supports step-up verification and authentication of user instructions. OpenAI and Stripe's Delegated Payment specification uses single-use payment credentials constrained by allowances such as maximum amount and expiry while leaving settlement, chargebacks and compliance with the merchant and its payment provider. Mastercard's Agent Pay approach similarly emphasises credentialled agents, permissioning, spending controls and verifiable intent; Worldline, ING and Mastercard reported an end-to-end European agentic payment in production in June 2026. These are payments examples rather than proof that autonomous investment or advice agents are ready, but they reveal an architectural pattern likely to travel: **identify the principal and actor separately; represent intent explicitly; attenuate authority; constrain the transaction; and maintain evidence of the chain**.

The implication is that an AI agent should generally not be represented simply as "the customer". Architecturally, it is better modelled as an **actor or workload acting for a principal**, potentially through an organisation, with an explicit authority relationship. Whether that actor is also legally an intermediary, distributor, adviser or another regulated party is context-specific. This separation prevents today's channel-centric customer-identity assumptions becoming tomorrow's architectural constraint.

The UK policy direction reinforces the value of this architecture. The Data (Use and Access) Act 2025 provides statutory foundations for Smart Data schemes and secure sharing with authorised third parties; its explanatory material explicitly links the model to continuing Open Banking and potentially extending its benefits to Open Finance. The FCA's April 2026 Open Finance roadmap sets a path from vision to delivery through 2030, while government consultation evidence notes that lack of real-time or automated third-party API access remains a constraint even where organisations possess similar internal capabilities. The FCA itself has described Open Finance as infrastructure that could help agentic commerce scale.

The EU is travelling in a related direction, although not on an identical timetable. FiDA is intended to extend structured financial-data access beyond payment accounts, with customer control and standardised technical interfaces, but the latest official European Parliament material located for this research still showed it progressing through the legislative process rather than as final law. The European Digital Identity framework requires Member States to provide EUDI Wallets by the end of 2026, creating potentially useful reusable identity and attestation infrastructure, although EUDI is a human/business identity mechanism rather than an answer to agent identity. DORA, already applicable since 17 January 2025, simultaneously means that externalisation cannot be achieved by indiscriminately moving responsibilities to third parties: ICT dependencies, resilience and evidence become more important as ecosystems deepen.

A third conclusion follows: **externalisation changes the operating contract of software**. Software used only inside the institution can often rely on coordinated releases, institutional knowledge, internal escalation routes and implicit dependencies. Once an external firm builds a proposition around it, backward compatibility, predictable change, SLOs, incident communication, capacity, metering and support become part of the product. Open Banking's publication of API availability and performance data is a useful manifestation of this shift. DORA and the FCA's operational-resilience framework reinforce the same principle from a regulatory direction: third-party dependence does not remove the financial institution's responsibility for resilience.

There is nevertheless a strong counterargument to indiscriminate externalisation. Every externally supported interface creates a long-lived obligation: attack surface, semantic stability, capacity, support, documentation, consumer communication and potentially regulatory exposure. Stripe's own platform architecture illustrates the trade-off particularly clearly: more customised, white-labelled connected-account models place greater integration, support and compliance burden on the platform, whereas using more provider-managed capabilities lowers that burden. The objective should therefore **not** be to make every internal service public. It should be to make valuable domain capabilities *externalisable by design*, and then deliberately productise the subset for which reuse, distribution or strategic optionality justifies the external contract.

The proposed architectural response is consequently not a giant central "API platform" that absorbs all business logic. It is a **Capability Access Plane**: a shared control plane through which independently owned domain capabilities can be discovered, onboarded, permissioned, governed, observed and consumed. Domain platforms retain product rules, transaction logic and authoritative data. The common plane provides reusable identity federation, partner and agent registration, delegated authority, consent, policy enforcement, interface discovery, contract management, credentials, sandboxes, conformance testing, telemetry, audit evidence and metering. Protocol adapters can offer REST, events, MCP or A2A without putting product logic in those adapters.

That architecture provides the bridge between the two halves of the research question. It removes technology that gets in the way of partnerships by converting repeated integration activities into shared platform capabilities. At the same time, it makes technology the **medium of partnership formation**, because an existing financial capability becomes something another proposition can compose without reconstructing the underlying institution.

The agentic extension makes this strategically more significant. Partnership readiness increasingly resembles **distribution readiness**. When customers or advisers use software agents to search across providers, machine-readable product information, permissioned access and trusted execution may influence whether a provider can participate at all. The future competitive question may therefore be less "is our website the destination?" and more:

> **Can our distinctive financial capabilities be discovered, understood, trusted and safely consumed wherever the customer—or an authorised actor acting for them—chooses to interact?**

The research supports that as the more durable target.

## Evidence-backed findings, economics and strategic tensions

**Ten most important findings**

| Finding | Why it matters | Evidence | Technology implication | Confidence |
|---|---|---|---|---|
| **Capability-first is a stronger model than API-first.** | APIs solve transport; partnerships require reusable business semantics, identity, controls and operational contracts. | Open Banking combines standards, directory/trust infrastructure and operating governance; Stripe and Adyen externalise onboarding and regulated workflow as well as endpoints. | Define externally consumable **business capabilities**, with APIs/events/components as delivery mechanisms. | High |
| **Identity and delegated authority are a hidden architectural bottleneck.** | B2B2C and agents separate the customer, partner, software actor and authority holder. Channel-login models do not represent those relationships well. | Open Banking maintains organisation/person identities and certificates; FAPI 2.0 is a final high-security OAuth profile. | Build common organisation/workload identity and delegated-authority services rather than solving credentials separately per partner. | High |
| **Standardisation needs shared trust and conformance infrastructure to generate ecosystem scale.** | A common JSON format alone does not create interoperability. | UK Open Banking passed 100bn cumulative API calls and 1bn payments; it combines common interfaces with security, participant governance and directory infrastructure. | Standardise security profiles, schemas, onboarding, certification and operational expectations as well as endpoint shapes. | High |
| **Externally consumed software becomes a product with an operational contract.** | Breaking an internal consumer is an incident; breaking an external dependency can interrupt another firm's regulated service. | Open Banking publicly tracks API performance; DORA formalises ICT resilience and third-party-risk expectations. | SLOs, compatibility, incident communication, support, observability and deprecation become design requirements. | High |
| **A significant amount of "security friction" is implementation friction rather than inherently required friction.** | Repeated manual credential exchange, static allowlists and duplicated questionnaires do not necessarily provide stronger control than reusable, machine-enforced policy. | FAPI 2.0 provides a standardised high-security OAuth profile; MCP itself is converging on standard OAuth discovery rather than proprietary security. | Shift from per-integration control implementation towards policy-as-code, short-lived credentials, conformance testing and evidence reuse. | Medium-high |
| **Open Finance is turning data portability from a feature into ecosystem infrastructure.** | Data trapped behind channels will become increasingly incompatible with UK Smart Data and EU financial-data directions. | The UK Open Finance roadmap runs to 2030; DUAA supports Smart Data; proposed FiDA extends structured data-sharing beyond payment accounts. | Treat authoritative data contracts, purpose/permission metadata and real-time access as platform capabilities. | High |
| **Agents are best treated technologically as actors, not replacements for customer identity.** | A transaction needs to preserve the principal even when software performs the action. | Visa uses agent-specific tokens and user-instruction authentication; agent-payment protocols are developing explicit permission and intent models. | Model `principal + actor + organisation + mandate + resource + action` separately. | Medium-high |
| **Most near-term agent readiness can build on today's security stack.** | Institutions need not wait for an entirely new agent-security architecture. | MCP uses OAuth-based authorisation; A2A uses conventional web security; FAPI 2.0 is final. Multi-hop agent delegation remains IETF work in progress. | Invest now in OAuth/FAPI, workload identity, sender-constrained short-lived tokens, fine-grained permissions and evidence; isolate experimental delegation protocols behind adapters. | High |
| **Machine-readable discoverability may become part of financial distribution.** | Agents cannot reliably compare or compose propositions hidden in web prose and human-only journeys. | A2A Agent Cards publish capabilities; MCP exposes structured tools; ACP consumes structured merchant catalogue data. | Product terms, eligibility, fees, disclosures, actions and status need canonical machine-readable representations as well as human experiences. | Medium |
| **A common externalisation plane is valuable only if it centralises controls, not domain logic.** | A central partnership team can otherwise become the next monolith and approval bottleneck. | Successful platforms separate reusable infrastructure from participant-specific experience; Thought Machine explicitly separates ledger capability from product logic. | Centralise identity, policy, onboarding, evidence and operations; leave pricing, eligibility, transactions and domain semantics with product domains. | Medium-high |

**Economics: measure marginal partnership cost, not API count.** There is not enough credible cross-industry public evidence to claim a universal percentage ROI from partnership platforms, and such numbers would be misleading given different regulatory and product scopes. There is, however, concrete evidence that reusable regulated capabilities can shorten proposition launches: ClearBank and Capital on Tap state that their embedded SME savings proposition moved from idea to launch in under six months, with ClearBank supplying the regulated banking/KYC infrastructure while Capital on Tap retained the customer-facing proposition. This is vendor-supplied case-study evidence, so it should be treated as illustrative rather than as a general benchmark.

The more useful internal economics are therefore:

| Measure | What it reveals |
|---|---|
| **Approved-partnership-to-first-production-transaction lead time** | Whether delivery is repeatable once commercial/regulatory decisions are made. |
| **Engineering effort per additional partner** | Whether marginal integration cost is actually falling. |
| **Partner-specific code as a share of delivery** | Whether the estate is composable or accumulating adapters. |
| **Percentage of onboarding/control steps automated** | Whether risk controls have been turned into reusable infrastructure. |
| **Percentage of integration assets reused** | Whether schemas, credentials, sandboxes, events and onboarding are common. |
| **Median time to provision sandbox and production credentials** | A direct indicator of developer experience and operational automation. |
| **Capabilities consumed through more than one channel/partner** | Whether capability reuse exists in production rather than architecture diagrams. |
| **Compatibility/deprecation incidents affecting external consumers** | Whether interfaces are genuinely product-managed. |
| **SLO, error rate and latency by partner/capability** | Whether the institution can operate external software as a service. |
| **Cost-to-serve and volume by partner/capability** | Whether commercial models reflect technology consumption. |
| **Partnership opportunities abandoned for technology reasons** | Makes the opportunity cost of the estate visible. |
| **Transactions carrying machine-verifiable authority context** | A useful future measure of delegated-access maturity. |

**Strategic tensions**

The research argues against four tempting extremes.

First, **reuse does not imply exposure**. A capability should be modular enough to expose, but only productised externally where its strategic value exceeds the lifecycle, security and support obligations created by exposure. Stripe's own account models demonstrate that deeper white-labelling and control increase integration and compliance responsibilities.

Second, **standardise the envelope, differentiate the value**. Authentication, workload identity, schemas, error conventions, observability, consent representation and audit are poor areas for proprietary differentiation. Product economics, investment propositions, risk intelligence, service and specialist business logic may be excellent ones. Open Banking's scale is evidence for common ecosystem rails; BlackRock's Aladdin Studio illustrates how proprietary financial capabilities can remain distinctive while still being externally programmable.

Third, **strong security and low friction are not opposites**. A reusable high-assurance profile, certificate/identity lifecycle and programmatic policy can remove repeated negotiation while making controls more consistent. The existence of FAPI conformance tests and final security profiles is particularly relevant here. The objective is not fewer controls; it is fewer bespoke implementations of the same control.

Fourth, **do not make an agent protocol the architecture**. MCP and A2A are useful adapters. Product capabilities should still be stable without them. That matters because multi-agent delegation remains an active standards problem and MCP's own authorisation model has continued evolving through 2026.

## Partnership friction, externalisation maturity and diagnostic

**Partnership friction map**

The following is a research synthesis rather than a claim that every institution experiences every issue. It identifies where repeated bespoke effort is most likely when external support has not been designed as a platform capability.

| Partnership stage | Typical technology friction | Underlying cause | Architectural leverage point |
|---|---|---|---|
| **Discovery** | Commercial teams cannot tell whether a capability is reusable without architecture investigation. External partners cannot see supported capabilities or integration patterns. | Capability knowledge lives in teams and channel architectures rather than a governed catalogue. | Capability catalogue with owners, contracts, data classification, supported actions, SLOs and externalisation status. |
| **Due diligence** | Repeated questionnaires, architecture walkthroughs, control evidence and dependency reviews. | Evidence is assembled manually; controls are described rather than machine-evidenced. | Reusable assurance packs, control evidence, certifications, dependency maps and automated policy/conformance evidence. |
| **Onboarding** | Manual entity registration, email-delivered secrets, network allowlists and bespoke customer/partner identity mapping. | IAM assumes employees or direct customers rather than organisations, workloads and third parties. | Partner directory, organisation/workload identities, automated registration, certificate/key lifecycle and standard OAuth/FAPI profiles. Open Banking demonstrates the directory/security pattern. |
| **Integration** | Custom adapters, channel-specific logic, translation between incompatible semantics and synchronous dependencies. | Business logic and data contracts are tied to applications rather than stable domains. | Channel-independent capability APIs, events, canonical domain semantics and partner-specific adaptation at the boundary. |
| **Testing** | Sandboxes differ materially from production; credentials take time; workflows cannot be tested end-to-end. | Testing environments were built for internal delivery teams. | Self-service sandbox, synthetic representative data, contract tests, conformance suites and test identities/mandates. |
| **Launch** | Coordinated releases, manual security gates, firewall changes and production credential ceremonies. | Controls and releases are process-driven rather than policy-driven. | Automated policy evaluation, release independence, dynamic configuration, rollout controls and deployment evidence. |
| **Operate** | Institution cannot separate partner failures, cost or latency; external users discover incidents before support teams. | Observability models applications and infrastructure rather than consumers and capabilities. | Partner/agent-aware telemetry, external SLOs, status communication, quotas, metering and support ownership. |
| **Change** | Every API enhancement becomes a coordinated programme because consumers may break. | No explicit compatibility/deprecation contract or consumer telemetry. | Schema/version policy, contract testing, compatibility gates, deprecation telemetry and controlled migration windows. |

The biggest opportunity is to distinguish **irreducible partnership work** from **repeated technology work**. A new investment distributor may genuinely require commercial, legal, conduct-risk and due-diligence decisions. Those cannot simply be automated away. Reissuing the same kind of client credential manually, creating another near-identical adapter or re-documenting the same control is different: those are candidates for platformisation.

**Proposed externalisation maturity model**

There is no robust public dataset from which to assert universal onboarding durations across financial institutions. The lead-time descriptions below should therefore be treated as **diagnostic expectations for the engineering component after necessary commercial/regulatory decisions**, not industry averages.

| Maturity | Architecture and data | Identity, security and operations | Partner experience | Reuse and expected engineering latency | Agent capability |
|---|---|---|---|---|---|
| **Internally coupled** | Business logic bound to UI/application; application-owned data; batch and database coupling common. | Human/channel identity; perimeter trust; internal-only support. | Externalisation is a project. | Near-total bespoke effort; commonly programme-scale. | None. |
| **Integration capable** | Point-to-point services, files and bespoke APIs; partner adapters sit near core systems. | Service accounts, static secrets/allowlists, manual controls. | Partner receives custom specifications and support. | Significant bespoke effort; usually measured in months rather than days. | Agents look like unsupported API clients. |
| **Standardised interface** | Common API/event guidelines, schemas, gateways and version rules emerge. | Standard OAuth/OIDC or mTLS patterns; central gateway controls. | Documentation/sandbox exists but onboarding still involves teams. | Lower transport effort, but domain/identity variation remains. | Technically callable, weak delegated authority. |
| **Productised capability** | Domain capability has stable contract, authoritative semantics, owner and lifecycle. | External SLO, observability, credentials, quotas and support model. | Developer portal, realistic sandbox, explicit onboarding path. | Existing capability can normally be integrated in weeks rather than rebuilt. | Agent can call capability where conventional delegated OAuth is sufficient. |
| **Composable estate** | Capabilities are channel-independent and combine through stable APIs/events; data contracts are governed. | Fine-grained policy, reusable partner/workload identity and automated conformance. | Partner selects multiple capabilities without separate integration model for each. | Marginal engineering effort falls sharply; business configuration dominates. | Strong foundation for single-agent use. |
| **Partnership platform** | Capability catalogue plus common externalisation/control plane; product domains remain independently owned. | Reusable delegated authority, consent, assurance, audit, metering and partner ops. | Self-service discovery/testing/onboarding for approved patterns. | Known integration patterns become configuration-heavy rather than build-heavy. | Agent consumer can be onboarded as a first-class workload. |
| **Agent-ready capability network** | Products, terms, eligibility, actions and events are machine discoverable; protocol adapters mediate agent interactions. | Principal/actor separation, agent identity, bounded mandates, intent evidence, re-delegation constraints and full provenance. | Humans, partner software and agents consume the same domain capabilities through appropriate surfaces. | New consumers can reuse existing capabilities; novel delegation patterns remain controlled. | Autonomous/semi-autonomous consumption supported within explicit policy. |

The final stage should **not** be interpreted as "publish an MCP server for everything". It means the underlying capability can safely support software-mediated discovery and delegated execution, while MCP/A2A or successor protocols can be attached as boundary mechanisms. MCP itself emphasises explicit user control around data and tool invocation, reinforcing that protocol accessibility alone is not sufficient authority.

**Partnership Readiness Scorecard**

A practical scoring mechanism is **0 = internal-only, 1 = bespoke, 2 = standardised, 3 = productised/self-service, 4 = composable and externally reusable**. Agent readiness should not inflate the score if the underlying capability is poorly productised.

| Dimension | What good looks like | Low-maturity signal | Likely engineering intervention | Useful measure |
|---|---|---|---|---|
| **Capability modularity** | Business logic operates independently of any one channel. | API invokes or screen-scrapes a channel-specific workflow. | Extract domain services/rules incrementally; stable domain ownership. | Partner-specific business-logic changes per launch. |
| **Interface maturity** | Versioned synchronous and asynchronous contracts appropriate to the use case. | Point-to-point APIs, undocumented side effects, polling. | API/event standards, schema registry, idempotency, contract testing. | Contract reuse and breaking-change rate. |
| **Data accessibility** | Authoritative semantics, lineage, purpose classification and real-time access where required. | Each partner receives separately transformed data. | Governed data contracts/products, streaming/event access, standard semantics. | Data mappings required per partner. |
| **Identity and delegated authority** | Person, organisation, workload and principal are distinct; authority is fine-grained and revocable. | Shared service accounts or customer-login impersonation. | Partner/workload IAM, FAPI/OAuth, mandate and permission service. | Manual identity steps; proportion of calls with scoped authority. |
| **Security automation** | Policy and conformance are machine-enforced and evidence-producing. | Spreadsheet review, firewall ticket and static long-lived secret for each partner. | Policy-as-code, certificate/key automation, short-lived tokens, automated assurance. | Manual control touchpoints per onboarding. |
| **Developer/partner experience** | Catalogue, docs, sandbox, synthetic data and credentials have a repeatable path. | Engineers must contact several internal teams to begin testing. | Portal, sandbox-as-product, self-service provisioning for approved partners. | Time to first successful test call. |
| **Operational independence** | External SLO, capacity, incident/support model and consumer-specific telemetry. | Internal app metrics are the only service view. | SRE/service ownership, external telemetry, status/event notification. | SLO attainment, mean time to identify partner impact. |
| **Discoverability** | Capability, eligibility, price/fees, actions and schemas are governed and increasingly machine readable. | Knowledge is in PDFs/web pages/account teams. | Capability/product catalogue and metadata APIs. | Percentage of externalisable capabilities catalogued. |
| **Metering/commercialisation** | Consumption and cost are attributable by partner/capability. | Infrastructure cost is pooled and partnership value cannot be related to usage. | Usage telemetry, quotas, charge/meter models. | Cost and revenue/value per capability/partner. |
| **Agent readiness** | Actor identity, bounded mandate, intent, high-risk confirmation and evidence travel with a request. | Agent would need the customer's login or an unrestricted partner credential. | Agent/workload identity, transaction-specific authorisation and provenance; protocol adapters later. | Percentage of eligible agent actions with machine-verifiable mandate/evidence. |

**Partnership Friction Diagnostic**

For an internal workshop, the scorecard should be paired with a concrete proposition, for example: *"Allow another organisation to embed our investment capability."* Rather than asking whether "we have APIs", trace an actual end-to-end transaction.

The diagnostic should establish whether the capability can execute without the institution's UI; where eligibility, pricing and product rules live; which data is authoritative; whether the interface is externally contracted; whether a partner can discover it and test it realistically; whether partner and workload identities can be provisioned through a standard mechanism; whether the customer's authority can be scoped and revoked; whether policy is evaluated programmatically; whether events exist for asynchronous state changes; whether an external consumer has an SLO; whether cost, volume and incidents can be attributed to that consumer; whether releases can occur independently; and whether a second partner could reuse the same stack without a second adapter.

For agent readiness, add a decisive test:

> **Could the institution determine, from the transaction evidence alone, which human or organisation was the principal, which software actor performed the action, what authority it held, what constraints applied, why the request was permitted and whether any additional human confirmation occurred?**

If the answer depends on reconstructing logs from several applications or assuming that possession of a credential equals customer authority, the capability is not yet agent ready.

## Agentic-era externalisation, journeys and candidate architecture

**What fundamentally changes?**

The central change is not that an LLM replaces an API client. It is that a software consumer may become **dynamic, delegated and decision-making**.

A conventional B2B integration usually has a known counterpart, negotiated beforehand, with a relatively static set of permitted calls. An agent may instead discover an available service at runtime, select it as one of several possible providers, infer which operation is useful and request authority related to a particular task. A further agent may then be invoked. That raises questions that ordinary API keys were never intended to answer.

The emerging standards stack is unevenly mature:

| Technology/pattern | Status at August 2026 | What it solves | What it does **not** yet solve |
|---|---|---|---|
| **OAuth/OIDC + modern security BCPs** | Established | User/client authentication and delegated API access. | Arbitrary cross-domain multi-agent authority chains. |
| **FAPI 2.0** | Final specification since February 2025, with conformance testing. | High-security OAuth profile suitable for financial-grade APIs. | Product/advice permissions or agent intent semantics by itself. |
| **MCP** | Rapidly maturing; July 2026 spec uses standard OAuth discovery. | Standard way for models/agents to discover and invoke tools/resources. | Legal authority, financial suitability, liability or customer mandate. |
| **A2A v1.0** | v1.0 released March 2026. | Agent discovery, capabilities, messages/tasks; signed Agent Cards can provide verifiable metadata. | End-to-end regulated delegation semantics. |
| **Agent-specific payments** | Early production/pilots and network solutions. Visa, Mastercard and ACP expose concrete approaches. | Credentialling, constrained payment authority, user intent and transaction execution. | General-purpose delegated authority across financial products. |
| **Multi-hop agent delegation** | Active IETF Internet-Draft work. | Proposed ways to preserve/attenuate delegation through agents. | A settled interoperable standard; should be treated as work in progress. |

This distinction gives a pragmatic investment rule: **build stable financial capability and authority primitives now; make agent protocols replaceable at the edge**.

**Agents as customers**

The phrase is strategically useful but architecturally dangerous. For most use cases, the agent should not overwrite the concept of customer. A better model is:

`Principal -> authority/mandate -> actor -> capability -> action`

The principal may be an individual, adviser firm or corporate. The actor may be a human, partner application or AI-agent instance. The authority binds the two and describes what the actor may do. This is consistent with the direction of agent-payment implementations, where an agent receives constrained credentials tied to customer instruction rather than becoming the economic principal itself.

That means B2B2C does not disappear. Instead, its **software topology becomes richer than its commercial/legal topology**. A B2B2C arrangement might technically contain customer agent → distributor agent → provider capability while legally remaining a consumer, distributor and manufacturer relationship.

**Worked journey: customer agent using an ISA capability**

Consider the prompt: *"Find the best available place for £10,000 of this year's ISA allowance based on my existing portfolio, risk preferences and fees."*

A credible architecture would not give the personal agent unrestricted access to the customer's financial estate.

| Step | Interaction | Technology/control required |
|---|---|---|
| **Intent** | Customer asks an agent to investigate options. | Authenticated principal; task record; explicit distinction between research authority and transaction authority. |
| **Discovery** | Agent discovers providers/products and supported operations. | Machine-readable product catalogue containing product type, fees, eligibility, required disclosures, supported actions and data freshness. A2A-style capability cards or MCP tools could expose execution surfaces, while product metadata should remain protocol-neutral. |
| **Data access** | Agent reads relevant portfolio/account data. | Fine-grained FAPI/OAuth consent tied to appropriate resources and purpose rather than the customer's reusable login credential. |
| **Comparison** | Agent compares products using current terms. | Authoritative structured pricing, eligibility and disclosure data plus provenance/time stamps. |
| **Recommendation boundary** | Agent moves from information to potentially regulated recommendation/action. | Policy must distinguish permitted assistance from advice/suitability activity and route to appropriate controls rather than relying on the model to infer the legal boundary. |
| **Transaction mandate** | Customer elects to proceed. | Separate authority for the irreversible action: product/capability, maximum £10,000, expiry, permitted source account and whether substitutions are allowed. Agent-payment systems already demonstrate amount/expiry-constrained credentials as a pattern. |
| **Step-up** | High-risk or consequential action is confirmed. | Customer authentication/confirmation independent of the agent's assertion where policy requires it. Visa's agent-payment design uses step-up and authenticated instructions as one emerging implementation pattern. |
| **Execution** | Provider evaluates request and opens/funds the product. | Agent identity + principal + mandate + eligibility + fraud/risk checks; short-lived resource-bound authority; idempotent transaction. |
| **Evidence** | Institution records what occurred. | Principal, agent identity/version where relevant, mandate, policy decisions, data used, action, confirmation, timestamps and resulting state. |
| **Ongoing servicing** | Agent checks state or performs subsequently authorised actions. | New scopes/mandates for different powers; events rather than unrestricted continuous polling where possible. |

The key technical change is that **the instruction becomes a first-class artefact**. In a human web journey, intent is often inferred from button clicks and session state. In an agentic journey, the institution needs more explicit evidence linking an autonomous action back to the customer's bounded authority.

**Worked journey: customer → adviser/partner → partner agent → financial institution**

The multi-party case exposes an even bigger weakness in conventional identity models.

A customer could grant an authorised adviser firm a mandate. An adviser-operated agent is then identified not merely as "Agent-17" but as a workload associated with that organisation and a particular authorised context. It discovers provider capabilities and constructs a proposal. Before invoking a provider, the partner presents both its organisational entitlement and the customer's relevant authority. The provider's access plane evaluates the effective authority: the adviser firm may be allowed to retrieve valuation and product information, while investment execution may need narrower customer-specific authority or a human approval.

The provider could itself use internal agents to coordinate eligibility, portfolio analytics and operations, but those internal agents should not become direct owners of the transaction. The authoritative domain capabilities execute the business action and write the resulting records. The evidence chain should retain enough information to answer: customer → adviser firm → partner-agent instance → provider orchestration → domain service → transaction.

This is precisely where standards are least settled. A2A can support the agent-to-agent conversation and identity/capability discovery, but current IETF work notes that cross-domain multi-hop delegation and permission attenuation still lack one established standard. The sensible near-term pattern is therefore to terminate and re-authorise trust at institutional boundaries, rather than blindly forward a delegation token down an arbitrary chain.

**Candidate reference architecture: the Capability Access Plane**

| Layer | Principal responsibility | What should live here |
|---|---|---|
| **Consumers and channels** | Where demand originates. | Own web/mobile channels; partner applications; embedded journeys; adviser platforms; customer agents; institutional agents. |
| **Protocol/interaction edge** | Translate consumer interaction into stable capability contracts. | REST/GraphQL where appropriate, webhooks/events, SDK/components, MCP adapters, A2A endpoints. **No core product rules.** |
| **Capability Access Plane** | Apply the reusable rules of external consumption. | Capability/product catalogue; organisation/workload/agent registration; identity federation; delegated authority/consent; policy enforcement; certificates/credentials; rate limits; schema/contracts; sandbox/conformance; metering; observability; audit/evidence; lifecycle/deprecation. |
| **Domain capability layer** | Own business semantics and transactions. | Eligibility; quotation; onboarding; account opening; portfolio data; orders; payments; servicing; advice-support functions; insurance/pension/investment capabilities. |
| **Data and systems of record** | Authoritative state. | Ledgers, books and records, positions, CRM/customer master, product master, risk, payments, custody and document stores. |
| **Enterprise control/evidence** | Cross-cutting resilience and governance. | Security telemetry, operational resilience, data lineage, model/AI governance, incident evidence, third-party risk and enterprise audit. |

The key architectural boundary is between the **access plane** and **domain capabilities**. The access plane knows *who can consume what, through which contract, under which constraints*. The domain knows *what the financial capability means and how the transaction is executed*.

A common plane should therefore include partner/agent onboarding, but not a central "partnership orchestration engine" in which every product's business rules are rewritten. Otherwise the organisation replaces many old monoliths with one new enterprise bottleneck.

**What becomes the equivalent of SEO?**

The evidence points towards something closer to **machine-readable proposition distribution** than conventional search optimisation. A product must be represented through current, authoritative facts—eligibility, cost, availability, supported actions, service level and trust/identity information—in a form software can discover and reason over. ACP already uses structured catalogue data; A2A defines capability metadata in Agent Cards.

For financial services, the bar should be higher than retail product feeds. Machine-readable information may need to include jurisdiction, target market, wrapper, risks, fees, advice requirements, eligibility, service restrictions, data timestamp, provider identity and the exact executable action. The resulting competitive capability is not merely "rank highly with AI". It is to be **accurately discoverable, comparable and executable without losing regulatory context**.

## UK and EU technology implications

Regulation is best treated here as architecture input rather than as a regulatory chapter.

| Development | Technology implication | Opportunity | Constraint | Time horizon/status at 31 Aug 2026 |
|---|---|---|---|---|
| **UK Data (Use and Access) Act 2025 / Smart Data** | Build for authorised third-party access, structured sharing and reusable permission models rather than channel-bound exports. | Can turn external data access into common national infrastructure instead of bilateral integrations. | Purpose, security, authorisation and scheme-specific requirements still need enforcement. | Act in force; implementation of individual Smart Data schemes evolves over time. |
| **FCA Open Finance roadmap** | Investments, pensions, insurance and other financial domains should anticipate open, permissioned data-access patterns beyond payment accounts. | Institution can become both a consumer and provider of broader financial data/capabilities. | Standardisation and prioritised use cases are still developing. | Roadmap published 14 Apr 2026, running towards 2030. |
| **UK Open Banking** | Demonstrates shared schemas, high-assurance API security, directory/trust, conformance and ecosystem operations. | Reuse its architectural lessons for wider partnership infrastructure. | Its governance/product scope cannot simply be copied wholesale into every financial domain. | Mature production ecosystem; >1bn payments and >100bn CMA9 API calls by July 2026. |
| **FCA Consumer Duty** | Product outcome and support evidence must survive when the customer journey is embedded or software-mediated; human escalation remains important. | Machine-readable product information and outcome telemetry could improve consistency across channels. | Delegating interaction to a partner/agent does not eliminate provider conduct responsibilities. | Duty has applied since 2023 and remains outcomes-focused. |
| **UK operational resilience / critical third parties** | External capabilities need explicit service ownership, impact mapping, SLOs and third-party dependency telemetry. | Shared resilience/evidence infrastructure can make partnerships easier to assure. | Outsourcing or platformisation cannot outsource accountability. | In-scope firms had to be within impact tolerances by 31 Mar 2025; FCA continues supervisory focus. |
| **GDPR / UK data protection** | Authority to invoke a capability does not automatically imply entitlement to all underlying personal data; purpose/minimisation must be carried into data access. | Consent/purpose metadata can become a reusable technology primitive. | Complex agent chains increase the importance of traceable purpose and data minimisation. | Established framework; Smart Data adds more structured access mechanisms rather than replacing data-protection obligations. |
| **DORA** | Architecture must capture ICT dependencies, external-service resilience, incident evidence and third-party concentration. | Standardised operational evidence can reduce repeat due diligence across ecosystem services. | Deep platform dependence creates concentration and exit risks alongside efficiency. | Applicable since 17 Jan 2025. |
| **FiDA** | Prepare domain data contracts and customer permission management beyond payments; avoid hard-wiring to draft details. | Could create EU-wide standardisation of financial-data interfaces and customer-controlled access beyond payment accounts. | Still legislative work rather than a settled production standard in the latest official material located for this research. | Proposed framework; Parliament tracker continues to describe the legislative process. |
| **PSD3 / Payment Services Regulation** | Maintain adaptable payment security, fraud, API and third-party-access controls rather than assuming PSD2 remains static. | More harmonised rules could further standardise payment ecosystem access. | Do not architect against provisional wording as if final implementation detail were settled. | Parliament/Council reached provisional political agreement 27 Nov 2025; ECON approved the negotiated text 5 May 2026. |
| **EUDI / eIDAS 2.0** | Design identity architecture so verified attributes/credentials can be accepted from external wallets and trust services. | Reusable verified identity/attribute evidence could reduce bilateral KYC/identity friction in relevant cases. | EUDI establishes identity infrastructure for people/businesses; it is not itself a cross-domain agent-authority solution. | Member States are required to provide EUDI Wallets by end-2026. |
| **EU AI Act** | Maintain AI-system inventory, governance, transparency and appropriate evidence around agent-mediated customer interactions. | Clear controls can make authorised use of agents easier to operationalise. | Compliance obligations depend on role/use case; the Act should not be mistaken for an agent-identity or delegation standard. | Broadly applicable from 2 Aug 2026; the July 2026 AI Omnibus changed some transition dates. |

Two particularly important signals emerge from this landscape.

The first is that the UK is moving towards **permissioned, reusable data infrastructure**. Government evidence published in 2026 explicitly identified cases where firms lacked automated or real-time third-party API access despite having comparable systems internally. That is almost an exact description of the partnership-readiness gap: technology works inside the boundary but is expensive to externalise.

The second is that EU and UK resilience rules make a simplistic "turn everything into an ecosystem service" strategy dangerous. Externalisation increases dependency graphs. The technology platform therefore has to make **dependency, authority and operational evidence more visible**, not less. DORA's focus on ICT third parties and the FCA's continued attention to service impact support this conclusion.

## Benchmark organisations and externalisation patterns

The strongest benchmark is not any single vendor; it is the recurring pattern across successful platforms: **the externally consumed product includes surrounding workflow and control capabilities, not merely the transaction API**.

| Example | What has been externalised | How it is consumed / reusable platform elements | What remains partner-specific | Lesson for an incumbent |
|---|---|---|---|---|
| **UK Open Banking** | Account/payment data access and payment initiation under common ecosystem standards. | Standard APIs, financial-grade security, participant directory/certificates, governance and performance expectations. | End propositions, customer experience beyond standards, commercial models and value-added services. | The strongest evidence that **API + trust + standard + governance + operations** can convert bilateral integration into ecosystem infrastructure. |
| **Stripe Connect** | Payments, accounts, identity/onboarding and marketplace/platform money movement. | Accounts APIs, hosted/embedded components and maintained verification flows. | Platform UX, commercial model and, depending on chosen integration model, portions of support/compliance responsibility. | Externalise the compliance-dependent workflow as a product, not just its endpoints. Also make responsibility allocation explicit. |
| **Adyen for Platforms** | User onboarding/verification, payments, funds splitting, balances and payouts, with additional financial products. | APIs and reusable platform account/balance structures; Adyen verifies platform users before payout. | Platform proposition, seller/user experience and commercial rules. | A partnership platform can expose a **family of interoperable capabilities** behind one common onboarding/control model. |
| **Wise Platform** | Cross-border payout infrastructure plus onboarding/KYC capabilities. | API/platform integration; Wise explicitly offers customisable onboarding and KYC for incorporation into partner experiences. | Partner's front end, use case and surrounding product. | Network and compliance complexity can be packaged into reusable capabilities, changing whether a partner needs to build that infrastructure itself. |
| **ClearBank + Capital on Tap** | Regulated bank accounts, payment infrastructure and KYC/CDD support embedded in another firm's experience. | ClearBank banking infrastructure and embedded-banking proposition; Capital on Tap owned the customer-facing experience. | Proposition, distribution, customer experience and partnership-specific implementation. | Technology externalisation can alter the **business model**, enabling a non-bank proposition to add a regulated savings capability without itself becoming a bank. Vendor-reported launch time was under six months. |
| **BlackRock Aladdin Studio** | Investment-management data and platform capabilities. | APIs enable customers to retrieve, write and modify data across the Aladdin ecosystem and build proprietary tools. | Client analytics, workflows, models and proprietary applications. | Wealth/asset-management externalisation is not limited to embedded UI; data, analytics and investment workflows can become programmable platform surfaces. |
| **FNZ** | Wealth platform spanning onboarding, advice, portfolio management, records, operations and related services. | FNZ describes the platform as modular and API-driven, supporting direct, intermediated and workplace channels. | Institution proposition, brand, investment choices and configuration. | In wealth, externalisation may mean **business-process and operating-platform externalisation**, not just APIs. |
| **Engine by Starling** | Banking technology itself as a B2B software product, including a full digital-banking platform and mobile SDKs. | Cloud-native pre-integrated platform plus configurable products/SDKs. | Adopting bank's regulatory model, proposition, configuration and migration. | A capability built for one institution can become an external product when operational and configuration boundaries are deliberately engineered. |
| **Thought Machine Vault** | Configurable core-banking and payment capabilities. | Vault Core separates foundational ledger workflows from product logic; streaming APIs provide real-time event integration. | Bank product design, integration, migration and operating configuration. | Separation of **capability from product configuration** improves reuse and keeps integration from dictating core architecture. |
| **Worldline / ING / Mastercard agentic payment** | Customer-authorised payment execution through an AI-mediated flow. | Existing payment/authentication infrastructure plus agent-specific trust mechanisms; the parties reported an end-to-end production transaction in Europe in June 2026. | The broader shopping/agent experience and future scaling model. | Agent-mediated transactions are no longer purely conceptual, but current evidence is strongest in payments rather than complex savings, investment or advice journeys. |
| **Visa / Mastercard agent-payment infrastructure** | Agent credentials, transaction permissions and user-instruction verification. | Visa uses agent-specific tokens and step-up/user-instruction authentication; Mastercard describes credentialled agents, spending controls and verifiable intent. | Agent reasoning, proposition discovery and merchant/provider business rules. | The emerging trust pattern is **principal + agent identity + explicit constraints + evidence**, rather than giving agents ordinary consumer credentials. |

The counter-evidence is as useful as the success cases. External platforms do not make responsibility disappear. Stripe documents how greater white-label control creates greater integration and compliance burden. DORA explicitly focuses on systemic and concentration risks associated with financial-sector reliance on ICT third-party providers.

Therefore the goal should not be maximum outsourcing or maximum centralisation. A partnership-ready institution needs to decide deliberately which layer it wants to own:

**distinctive financial capability → regulated control → reusable access infrastructure → distribution experience.**

An institution may create strategic advantage in any of those layers, but it should avoid accidentally owning bespoke technology in all four for every partnership.

## Implications for an incumbent financial institution

**Now: strengthen capabilities that do not depend on agentic standards**

The first wave should not be labelled an "agent programme". It is the foundation for conventional partnerships **and** agents.

The institution should create an inventory of candidate external capabilities based on business domains rather than existing APIs. For each, identify the owner, authoritative data, supported actions, customer/organisation identities involved, regulatory classification, SLO, dependencies and current external interfaces. This establishes which capabilities are genuinely reusable and which APIs merely expose channel implementations.

In parallel, the organisation should converge on a financial-grade external access pattern based on established OAuth/FAPI principles, explicit organisation and workload identities, short-lived credentials and a common partner directory/onboarding model. FAPI 2.0 is final and conformance tooling exists, so this is a lower-regret foundation than inventing agent-specific security.

A common sandbox and conformance capability is another immediate investment. It should provide representative synthetic data, the same contract versions as production, predictable credentials, event simulation and failure cases. The goal is to turn "can this partner integrate?" from an internal project into something that can be demonstrated.

Operationally, externally consumable capabilities should acquire explicit SLOs, consumer-aware telemetry, compatibility policies, incident communications and service ownership. UK Open Banking's publication of availability/performance illustrates the operating discipline associated with ecosystem infrastructure.

Finally, start converting repetitive security decisions into **policy and evidence**: credential lifetime, permitted scopes, transaction limits, data purposes, partner classifications and step-up conditions. This makes stronger controls reusable.

**Next: build the reusable authority and discovery layer**

Over approximately the next two to three years, a deeper capability should emerge: a **delegated-authority service** that represents not just "this OAuth client has scope X" but why the actor may exercise that scope for a particular principal.

It should be able to represent an authority such as:

> Adviser Firm A, through approved workload B, may retrieve Customer C's portfolio and initiate rebalance proposals until date D, but cannot execute orders above threshold E without new customer confirmation.

That is the bridge between traditional partnership IAM and agentic access.

Machine-readable product and capability discovery should develop alongside it. The institution does not need to predict the final agent discovery protocol. It does need canonical APIs/data products for product terms, fees, eligibility, disclosures and supported actions. Those can later be rendered into an A2A Agent Card, MCP tool surface, partner portal, comparison feed or another protocol without making the underlying product metadata protocol-specific. A2A and ACP already show that structured capability/catalogue information is becoming an important primitive.

EU institutions should also make identity architecture capable of accepting external verified attributes as EUDI rolls out, without treating the wallet itself as the institution's full authorisation model.

MCP and A2A should begin as controlled **adapters onto approved domain capabilities**, preferably read-only or low-consequence workflows first. They should inherit rather than bypass enterprise IAM, policy, observability and audit.

**Emerging: pursue as controlled experiments rather than foundational dependencies**

Fully autonomous financial-product selection and execution across multiple providers remains materially less mature than agentic payments. Complex financial products introduce eligibility, suitability/advice questions, cooling-off or disclosure requirements, taxation, conduct obligations and longer-lived servicing relationships that retail checkout protocols do not solve.

Multi-hop delegation such as:

`consumer → personal agent → adviser agent → provider agent → financial capability`

should similarly remain ring-fenced while its interoperability standards develop. August 2026 IETF work still characterises multi-hop delegation and cross-domain authority as gaps requiring further standards work.

Potentially important emerging models nevertheless include machine-to-machine commercial relationships and very high-frequency autonomous payments. Mastercard's June 2026 Agent Pay for Machines proposition explicitly targets programmatic, permissioned machine payments, including low-value/high-frequency scenarios. This suggests that eventually B2B partnerships might not always correspond to long-lived bilateral application integrations: software agents could dynamically source capabilities or data under standing organisational authority.

That is credible enough to influence architectural optionality, but not mature enough to justify replacing conventional platform foundations.

**Open questions requiring internal evidence or leadership choices**

The key unresolved issues are not protocol questions. They are strategic and organisational.

Which 10–20 capabilities create enough differentiated value or distribution optionality to justify an external product contract? Which capabilities should explicitly **never** be externally consumable because their risk, economics or internal coupling makes the obligation uneconomic?

How much current partnership delivery effort is genuinely partner-specific business work versus repeated identity, data mapping, assurance, testing and production-onboarding work? Without measuring that baseline, the value of a common access plane cannot be demonstrated.

Where is business logic actually located today: domain platforms, channels, orchestration layers or manual operations? The answer determines whether externalisation is an interface problem or a deeper capability-modularity problem.

Does the existing IAM stack represent customers, organisations, partner users, workloads and delegated authority as distinct concepts? Can authority be revoked or narrowed without disabling an entire partner integration?

Who would own an externally consumable capability's contract, SLO, roadmap and deprecation decisions? An API platform cannot substitute for domain product ownership.

Would a common Capability Access Plane accelerate domains or become another mandatory central delivery team? Its operating model is as important as its technical architecture.

How would the institution determine whether an agent-mediated interaction constitutes information, guidance, advice, discretionary action or another regulated activity in each business line? Technology should encode the resulting boundaries but cannot decide the policy alone.

What level of customer confirmation should be mandatory for different classes of action? Payments examples are already moving towards bounded credentials and verifiable intent, but investments and pensions may require a different risk model.

Finally: where does the institution strategically want to sit if the customer interface becomes less important? Does it want to own the agent/customer interface, provide distinctive capabilities to other agents and distributors, or do both?

**Final synthesis: what would we design differently from scratch?**

If designing a financial-services technology estate today with the explicit objective that any *appropriate* capability might later be used by an internal channel, another firm, an embedded experience or an authorised AI agent, five architectural choices would change most.

**First, design channel-independent business capabilities rather than channel-backed services.** Account opening, portfolio valuation, eligibility, dealing, payment, servicing and other domain functions would have stable semantic boundaries and authoritative owners. UI journeys would compose them rather than own their fundamental rules. BlackRock's programmable Aladdin surface, Thought Machine's separation of ledger and product logic, and platform patterns from Stripe/Adyen demonstrate different manifestations of this principle.

**Second, separate identity from authority from the outset.** The model would explicitly recognise a human principal, organisation, human representative, workload and potentially agent instance as different entities. It would answer "who are you?" separately from "for whom are you acting?" and "what exactly may you do now?" Established FAPI/OAuth foundations would provide the near-term security substrate.

**Third, create a Capability Access Plane rather than a collection of partner gateways.** Discovery, onboarding, partner/workload registration, delegated authority, policy, credentials, contracts, sandboxes, telemetry, metering and evidence would be reusable enterprise capabilities. Open Banking's common directory/security/operating infrastructure is the clearest public evidence for this architectural pattern at ecosystem scale.

**Fourth, make product, data and operating contracts machine readable.** Externalisation would encompass more than API schemas: product terms, eligibility, fees, disclosures, service states, events, provenance, SLOs and deprecation would be governed information. This becomes increasingly important as A2A, MCP and agentic-commerce systems move capability discovery from human documentation into software interactions.

**Fifth, make external consumption a first-class software lifecycle.** Every externalised capability would include backward compatibility, conformance testing, consumer-aware telemetry, incident communication, capacity controls, evidence and cost attribution. The regulatory direction in DORA and UK operational resilience strengthens rather than weakens this requirement.

The resulting architecture is therefore **not "API-first" in the narrow sense**. It is:

> **Capability-first, authority-aware and externally operable.**

The long-term ambition is not that every piece of software becomes public. It is that the institution can make a deliberate commercial decision to expose a suitable capability **without discovering afterwards that its technology estate makes the decision prohibitively slow or bespoke**.

**Alternative framing for the later CIO/CTO paper**

| Framing | Central thesis | Proposed title | Supporting argument | Evidence anchor | Executive conversation to provoke |
|---|---|---|---|---|---|
| **Conservative technology-enablement framing** | Partnership delays often arise because reusable controls and capabilities are repeatedly implemented as bespoke integration work. | **From Integration Projects to Partnership-Ready Capabilities** | Separate irreducible commercial/risk work from repeated engineering; productise APIs and events; create reusable identity/onboarding; apply external SLOs; measure marginal partner cost. | UK Open Banking's standardised ecosystem; Stripe/Adyen onboarding patterns; ClearBank embedded-banking case. | **Which common technology investments would materially reduce time and engineering effort for the next five partnerships?** |
| **Strategic partnership-platform framing** | The institution should make selected business capabilities safely consumable through a shared control plane, turning externalisation from a project into an enterprise capability. | **Make the Firm Consumable: A Technology Architecture for Partnerships** | Capability-first over API-first; centralise access/authority rather than domain logic; machine-readable products/data; common assurance/operations; use Smart Data/Open Finance as strategic infrastructure. | Open Banking directory/security model; UK Open Finance roadmap; Aladdin/FNZ/platform examples. | **Do we want externalisation to remain a capability of individual programmes, or become a strategic platform property of the estate?** |
| **Forward-looking agentic distribution framing** | If agents become important customer interfaces, the ability to be discovered, permissioned and transacted with by software becomes a new dimension of distribution readiness. | **When the Customer Interface Becomes an Agent** | Agent is an actor not the customer; intent/mandate becomes first-class; product propositions become machine-readable; current OAuth/FAPI foundations remain valuable; MCP/A2A are adapters while multi-hop delegation matures. | A2A v1.0 and MCP 2026 standards; Visa/Mastercard constrained agent payments; first European production agentic-payment examples; FCA's linkage between Open Finance and agentic commerce. | **Are today's partnership investments merely reducing integration cost, or are they also preparing the institution for a future in which software agents mediate product discovery and distribution?** |

Across all three framings, the same strategic idea survives the evidence:

> **Partnership readiness is the ability to turn a valuable internal capability into a safely consumable external product without rebuilding the institution around each consumer. In the agentic era, that external consumer may increasingly be software acting under delegated authority—making partnership architecture inseparable from future distribution architecture.**