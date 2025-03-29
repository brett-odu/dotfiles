# Dotfiles Automation / Ansible – Usage Guide

So you want to run this beast? Excellent. Here’s how to use the automation stack without nuking anything important (ideally).

---

## 🗄️ Project Layout Refresher

If you haven't already read the top-level [`README.md`](./README.md), go there for a vibe check and overview.
This guide assumes you know this stuff lives under `automation/ansible/` and what each role does.

---

## 🏃🏻 Running the Playbook

### Run everything, everywhere
```bash
ansible-playbook -i inventory/hosts.yml playbook.yml
```

### Limit to a group
```bash
ansible-playbook -i inventory/hosts.yml playbook.yml -l containers
```

### Limit to a single host
```bash
ansible-playbook -i inventory/hosts.yml playbook.yml -l ubuntu24
```

This limits the run to just one target machine. You can also combine multiple hosts or use patterns (e.g. `web*` or `ubuntu24:debian12`).

### Run a single role (via tags)
```bash
ansible-playbook -i inventory/hosts.yml playbook.yml --tags ssh_setup
```

### Start at a specific task
```bash
ansible-playbook -i inventory/hosts.yml playbook.yml --start-at-task="Install Rust"
```

---

## ⚙️ Inventory Setup

Your inventory is defined in `inventory/hosts.yml` using YAML. Hosts are grouped into logical environments like `containers`, `utm`, `local`, and `redhat_like`. Here's a simplified example:

```yaml
containers:
  hosts:
    ubuntu:
      ansible_host: ubuntu
    debian:
      ansible_host: debian

utm:
  hosts:
    rhel10:
      ansible_host: rhel10
    ubuntu24:
      ansible_host: ubuntu24-04

local:
  hosts:
    localhost:
      ansible_connection: local
```

You can define as many groups as needed. These are flat top-level keys in YAML, not nested under `all`. This setup works well for test environments and production alike.

Make sure that:
- Hostnames match your SSH config or IPs
- Any custom SSH settings (like key paths or non-standard ports) go in `group_vars` or `host_vars` as needed

---

## ✏️ Things You'll Need to Customize

A few things **must** be set in your `inventory/group_vars/all.yml`:

### Required Variables
```yaml
dev_user: jutah
ansible_user: ansible
```

### Variable Placement – Rule of Thumb
| 🔧 Variable Type                 | 📁 Best Location                        |
|----------------------------------|-----------------------------------------|
| Shared across hosts/roles        | `group_vars/all.yml`                    |
| Specific to one host, or group    | `host_vars/<hostname>.yml`              |
| Role-scoped but user-overridable | `roles/<role>/defaults/main.yml`        |
| Role-internal constants          | `roles/<role>/vars/main.yml`            |

---

## 🧪 Testing Tips

- Use lightweight VMs or containers to validate each OS
- You can skip full installs with `--tags cli_tools`, `language_env`, or just the parts you're testing
- Debug facts or variables with:
```bash
ansible -i inventory/hosts.yml all -m setup
```

---

## 🩹 Linting Notes

- This project follows [Ansible Lint's rules](https://ansible-lint.readthedocs.io/en/latest/rules/) — `ansible-lint --fix` can auto-correct most minor issues.
- We prefer `ansible.builtin.*` and `community.general.*` FQCNs for clarity and future-proofing.
- Use `creates:` or `changed_when:` with `shell` and `command` tasks to avoid false positives in change reporting.
- Avoid `ignore_errors: true`; use `failed_when` to be specific.

---

## 🛟 Troubleshooting

### "Permission denied" or "sudo: no tty present"
Your user may not have passwordless sudo. Either fix the sudoers entry or run with `--ask-become-pass`.

### Shell issues after provisioning?
You may need to logout/login or full shell reload (`exec zsh`, `newgrp docker`, etc.).

### Re-run just one role?
Use `--tags`, or edit `roles/<role>/tasks/main.yml` to comment/uncomment as needed.

### Playbook failed halfway?
You can `--start-at-task` from the last green one, or just re-run — most tasks are idempotent.

---

## ✅ Final Checks

After provisioning, confirm:

- `which nvim`, `which bat`, `docker info`, `fzf`, etc. all work without `sudo`
- The default shell is Zsh (`echo $SHELL`)
- Your dotfiles are in place and symlinked
- Fonts work (JetBrainsMono Nerd Font installed system-wide)

---

You're now equipped to wield this repo for maximum shell supremacy.

When in doubt, `ansible-playbook --step` and watch the magic happen.

---