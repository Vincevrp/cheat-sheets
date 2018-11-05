---
title: 'Security cheat sheet'
abstract: "Quick reference for common security practices on GNU/Linux. Work in progress"
---

# Change ecryptfs passphrase

To change your ecryptfs passphrase, run:

```
ecryptfs-rewrap-passphrase /home/.ecryptfs/$USER/.ecryptfs/wrapped-passphrase
```

Then continue to change your user password, if required:

```
passwd
```

# Change passphrase of SSH private key

```
ssh-keygen -f .ssh/id_rsa -p
```

