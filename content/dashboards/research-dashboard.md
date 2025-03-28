# 🧠 Research Dashboard
> View and manage all your research material

```dataview
table file.name as "Title", date as "Date", tags
from "01-research"
where !contains(file.name, "template")
sort date desc
```