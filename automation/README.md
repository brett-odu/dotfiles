in progress

1. Role Structure & Modularity
2. Use `tags` Strategically
3. Cross-Platform Support
4. Idempotency is Everything
5. Dependency Management
6. Use `include_vars` or `set_fact` for Config Flexibility
7. Use `ansible.builtin.*` in Modules
8. Avoid Hardcoding Paths
9. Separate Secrets
10. Use Collections
11. CI/CD Integration
12. Docs & Self-Discovery

1. In UTM:

* NIC 1 → Shared Network
* NIC 2 → Emulated VLAN
* Port Forwarding:
    * Protocol: TCP
    * Guest Address: 10.0.2.15
    * Guest Port: 22
    * Host Address: 127.0.0.1
    * Host Port: 2224, 2225, etc.

2. In the new VM:
```bash
sudo nmcli con add type ethernet ifname enp0s2 con-name vlan-static ipv4.method manual ipv4.addresses 10.0.2.15/24
sudo nmcli con up vlan-static
```

On your Mac: In `~/.ssh/config`:

```bash
Host rocky-vm
    HostName 127.0.0.1
    Port 2224
    User bwarren
```

## Rule of Thumb
| Variable Type | Best Location |
| --- | --- |
| Shared across hosts/roles | `group_vars/all.yml` |
| Specific to one host | `host_vars/<hostname>.yml` |
| Role-scoped but user-overridable | `roles/<role>/defaults/main.yml` |
| Role-internal constants | `roles/<role>/vars/main.yml` |