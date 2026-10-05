# Open Design Questions

Resolve these experimentally.

1. **Atomicity:** overview + atomic reusable choices/assumptions/evidence, or fewer large files? Avoid both giant documents and object explosion.
2. **Relationship syntax:** generic `relationships:` map vs named top-level fields vs links in prose. Initial bias: controlled relationships map + normal Markdown narrative links.
3. **Evidence:** store concise summary/metadata/link by default; do not copy restricted source data unless needed.
4. **Graph:** begin with simple JSON nodes/edges. No graph DB until queries require it.
5. **Context cache:** benchmark direct canonical navigation vs generated context. Remove cache layers that do not help.
6. **Links:** normal Markdown for human portability; stable IDs/metadata drive the graph.
7. **Quartz:** one-day publishing spike; kill if it dictates source structure.
8. **Confluence publisher:** compare approved/internal tool with open-source one-way publishers; require dry run, hierarchy, link handling and security fit.
9. **Question writing:** agent proposes into inbox, human promotes. Revisit automation only after measuring noise.
10. **Support status:** make deterministic where possible; model judgement only for semantic ambiguity.
11. **Staleness:** start with explicit review dates and evidence dates.
12. **Versioning:** Git history first; avoid complex strategy-version semantics.
13. **Copilot page shape:** compare giant page vs moderate topic pages. Initial bias: moderate pages with IDs/headings/cross-links.
14. **Architecture corpus:** add architecture object types only when strategy content actually needs them.
15. **Natural-language edits:** Q&A is broad; canonical mutation remains explicit/reviewed.
