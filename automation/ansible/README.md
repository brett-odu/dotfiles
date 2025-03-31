# Dotfiles Automation / Ansible

Welcome to the Ansiblified underbelly of my dotfiles setup. This directory contains all the automation to transform a barren shell of a VM into a finely-tuned development environment — or at least, something I won't immediately regret logging into.

This setup is designed for *my future self*, fellow devs, and the occasional brave contributor. It aims to be reproducible, cross-platform, modular, and just opinionated enough to be dangerous.

---

## 📂 Structure Overview

```bash
./automation/ansible
├── ansible.cfg               # Ansible configuration tweaks
├── inventory/                # Host + group definitions
│   ├── group_vars/            # Per-group variables
│   ├── host_vars/             # Per-host variables
│   └── hosts                 # Inventory file (flat or ini-style)
├── playbook.yml              # Main playbook
├── roles/                    # Task logic grouped by intent
│   ├── cli_tools/              # Tools like bat, fzf, tmux, etc.
│   ├── common/                # Setup logic used across OSes
│   ├── devops/                # Helm, Docker, Podman, etc.
│   ├── dotfiles/              # Clone + symlink config files
│   ├── language_env/         # Rust, Go, Ruby, Python environments
│   ├── node_env/             # Node, NVM, TypeScript
│   ├── shell_setup/          # Zsh, default shell, etc.
│   ├── system_cleanup/       # Final polishing + user perms
│   └── system_setup/         # Users, packages, Neovim, fonts, etc.
```

---

## ⚒️ Dependencies

Make sure the machine you're running this from has:

- [Ansible](https://docs.ansible.com/) 2.15+
- SSH access to the target
- `python3` and common distro packages on the target system (Ansible will install others)
- Your SSH key loaded (private key must be accessible if copying it to remote VMs)

### 🧪 Development Tools

If you're contributing to this repo, you'll want:

- [`ansible-lint`](https://ansible-lint.readthedocs.io/en/latest/) for enforcing playbook best practices
  - Installed via `pipx`, `brew`, or however your soul prefers
  - See [CONTRIBUTING.md](CONTRIBUTING.md) for lint rules and usage tips
- `yamllint`, optionally, to keep your YAML tidy

---

## 🔐 Assumptions

Every target VM is expected to have a user named `ansible` with passwordless sudo access. If you're running this against something that doesn't, you'll want to set up an appropriate sudoer entry or adjust your connection logic in `inventory/`.

---

## 🚀 Supported Operating Systems

| OS            | Version(s) Tested |
| ------------- | ----------------- |
| Ubuntu        | 24.04             |
| Debian        | 12                |
| Kali Linux    | 2025              |
| Fedora        | 42                |
| CentOS Stream | 10                |
| AlmaLinux     | 9                 |
| Rocky Linux   | 9                 |
| RHEL          | 10 (Beta)         |

ARM and x86\_64 both supported. Special edge cases handled with a combination of duct tape and `set_fact` wizardry.

---

## 👟 Next Steps

- [Usage Guide](USAGE.md) — how to run specific roles, pass vars, or debug
- [CONTRIBUTING.md](CONTRIBUTING.md) — guidelines for opening PRs or submitting tasks
- Per-role READMEs — dive deeper into the logic, gotchas, and clever hacks

---
