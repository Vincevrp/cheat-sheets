---
title: 'Git cheat sheet'
abstract: "Quick reference for git commands that aren't covered on a daily basis. Basic git knowledge is required."
---

# Undo unpushed commits

To delete the most recent commit, keeping the work you've done:

```
git reset --soft HEAD~1
```

To delete the most recent commit, **destroying** the work you've done:

```
git reset --soft HEAD~1
```

[Source](https://stackoverflow.com/questions/3197413/how-do-i-delete-unpushed-git-commits)

# Rebase from upstream

This allows you to pull changes made in the original repository into your fork.

```
git remote add upstream git@github.com:X/X.git
git fetch upstream
git rebase upstream/master
```


