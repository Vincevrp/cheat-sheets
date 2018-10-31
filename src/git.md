---
title: 'Git cheat sheet'
abstract: "Quick reference for git commands that aren't covered on a daily basis"
---

# Rebase from upstream

This also allows you to pull changes made in the original repository with your fork.

```
git remote add upstream git@github.com:X/X.git
git fetch upstream
git rebase upstream/master
```

