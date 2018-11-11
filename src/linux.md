---
title: 'Linux cheat sheet'
abstract: "Quick reference for the GNU/Linux command line. It is assumed that you use Bash. This definitely isn't a complete list, my goal is to have a reference for handy commands that aren't use on a daily basis. Knowledge of GNU/Linux and Bash is required."
---

# Find command

Used to search for files in a certain directory hierarchy.

## Basic usage

Find files with a given extension from the current directory.

```
find . -name "*.png"
```

Find files with multiple specified extensions from the current directory.

```
find . -type f \( -iname \*.png -o -iname \*.jpg \)
```

## Execute command on files

Run a single command:

```
find . -name "*.png" -exec echo {} \;
```

Run multiple commands:

```
find . -name "*.png" -exec echo {} \; -exec touch {} \;
```

The second command will only run if the first command runs successfully.

# Watch command

Used to run a certain command at a specified interval. Usage example:

```
watch -n 5 free -m
```

The -d (difference) parameter is used to highlight the differences between updates.

```
watch -d -n 5 free -m
```

# References

[Find man page](https://linux.die.net/man/1/find)

[Unix Stack Exchange](https://unix.stackexchange.com/)

[The watch Command](http://www.linfo.org/watch.html)
