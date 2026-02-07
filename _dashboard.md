# Article Dashboard

Central overview of all articles, their status, and performance metrics. Powered by [Dataview](https://github.com/blacksmithgu/obsidian-dataview).

---

## Pipeline Overview

```dataview
TABLE WITHOUT ID
  file.link AS "Article",
  status AS "Status",
  phase AS "Phase",
  word-count AS "Words",
  read-time AS "Read (min)",
  dateformat(created, "yyyy-MM-dd") AS "Created",
  dateformat(published, "yyyy-MM-dd") AS "Published"
FROM "articles"
WHERE file.name = "index"
SORT created DESC
```

## Published — Performance

```dataview
TABLE WITHOUT ID
  file.link AS "Article",
  dateformat(published, "yyyy-MM-dd") AS "Published",
  views AS "Views",
  claps AS "Claps",
  comments AS "Comments",
  shares AS "Shares",
  round(claps / views * 100, 1) + "%" AS "Clap Rate"
FROM "articles"
WHERE file.name = "index" AND status = "published"
SORT views DESC
```

## In Progress

```dataview
TABLE WITHOUT ID
  file.link AS "Article",
  status AS "Status",
  phase AS "Phase",
  dateformat(created, "yyyy-MM-dd") AS "Created"
FROM "articles"
WHERE file.name = "index" AND status != "published"
SORT created ASC
```

## Articles by Tag

```dataview
TABLE WITHOUT ID
  tag AS "Tag",
  length(rows) AS "Articles",
  rows.file.link AS "Article List"
FROM "articles"
WHERE file.name = "index"
FLATTEN tags AS tag
GROUP BY tag
SORT length(rows) DESC
```

## Articles by Audience

```dataview
TABLE WITHOUT ID
  aud AS "Audience",
  length(rows) AS "Articles",
  rows.file.link AS "Article List"
FROM "articles"
WHERE file.name = "index"
FLATTEN audience AS aud
GROUP BY aud
SORT length(rows) DESC
```

## Monthly Output

```dataview
TABLE WITHOUT ID
  dateformat(created, "yyyy-MM") AS "Month",
  length(rows) AS "Articles",
  rows.file.link AS "Titles"
FROM "articles"
WHERE file.name = "index"
GROUP BY dateformat(created, "yyyy-MM")
SORT key DESC
```

## Totals

```dataview
TABLE WITHOUT ID
  length(rows) AS "Total Articles",
  sum(rows.views) AS "Total Views",
  sum(rows.claps) AS "Total Claps",
  sum(rows.comments) AS "Total Comments",
  round(sum(rows.claps) / sum(rows.views) * 100, 1) + "%" AS "Avg Clap Rate"
FROM "articles"
WHERE file.name = "index" AND status = "published"
```
