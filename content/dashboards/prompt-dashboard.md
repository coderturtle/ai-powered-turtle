# 🎯 Prompt Dashboard
> Browse and categorize useful prompts

```dataview
table file.name as "Prompt", category, tags
from "02-prompts"
where !contains(file.name, "template")
sort file.name asc
```