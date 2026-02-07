# Promotion Tracker

Track which platforms each article has been promoted on. Powered by [Dataview](https://github.com/blacksmithgu/obsidian-dataview).

---

## Promotion Status by Platform

```dataview
TABLE WITHOUT ID
  file.link AS "Article",
  dateformat(published, "yyyy-MM-dd") AS "Published",
  choice(linkedin-posted, "✅", "⬜") AS "LinkedIn",
  choice(twitter-posted, "✅", "⬜") AS "Twitter",
  choice(reddit-posted, "✅", "⬜") AS "Reddit",
  choice(hn-posted, "✅", "⬜") AS "HN",
  choice(devto-posted, "✅", "⬜") AS "Dev.to"
FROM "articles"
WHERE file.name = "index" AND status = "published"
SORT published DESC
```

## Promotion Completion Rate

```dataview
TABLE WITHOUT ID
  file.link AS "Article",
  round(
    (choice(linkedin-posted, 1, 0) +
     choice(twitter-posted, 1, 0) +
     choice(reddit-posted, 1, 0) +
     choice(hn-posted, 1, 0) +
     choice(devto-posted, 1, 0)) / 5 * 100
  ) + "%" AS "Promoted"
FROM "articles"
WHERE file.name = "index" AND status = "published"
SORT published DESC
```

## Unpromoted Articles

```dataview
LIST
FROM "articles"
WHERE file.name = "index"
  AND status = "published"
  AND (
    !linkedin-posted OR
    !twitter-posted OR
    !reddit-posted OR
    !hn-posted OR
    !devto-posted
  )
SORT published ASC
```

## Platform Timing Reference

| Platform    | Best Days | Best Times (EST) | Notes                                |
| ----------- | --------- | ----------------- | ------------------------------------ |
| LinkedIn    | Tue-Thu   | 9 AM-12 PM        | Link in first comment, not post body |
| Twitter/X   | Tue-Thu   | 10 AM-2 PM        | Pin thread for first week            |
| Reddit      | Mon-Wed   | 9 AM-12 PM        | Respond to all Qs within 6 hours     |
| Hacker News | Tue-Thu   | 8-10 AM            | Use exact article title              |
| Dev.to      | Any       | Any                | Cross-post 1 week after Medium       |
