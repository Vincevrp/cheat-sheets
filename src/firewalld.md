---
title: 'Firewalld cheat sheet'
abstract: "Quick reference for the most common firewalld commands. This definitely isn't a complete list, just a reference for the commands I use the most."
toc: false
---

# Start and enable firewalld

```
sudo systemctl start firewalld
sudo systemctl enable firewalld
```

# Basic commands

| Command / parameter                     | Explanation                                |
| -------------------------------------   | ------------------------------------------ |
| `firewall-cmd`                          | Base command                               |
| `--state`                               | Check state                                |
| `--permanent`                           | Append to a command to make it permanent   |
| `--get-active-zones`                    | Show the active zones                      |
| `--list-all`                            | List the active configuration              |
| `--list-all --zone=public`              | List the configuration for a specific zone |
| `--list-ports`                          | List firewall ports                        |
| `--zone=public --add-port=5000/tcp`     | Allow port in a specific zone              |
| `--zone=public --add-service=http`      | Add service to zone                        |
| `--zone=public --change-interface=eth1` | Add interface to zone                      |
| `--zone=public --list-services`         | List services that are enabled in a zone   |

