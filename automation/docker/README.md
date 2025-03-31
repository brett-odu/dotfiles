# 🐳 Docker Images for Ansible Testing

This directory contains Dockerfiles and guidance for building and using test containers with [Ansible](https://www.ansible.com/) for multi-distro automation.

---

## 🧱 Dockerfile Overview

### `Dockerfile.ubi10`
- **Base:** Red Hat UBI 10 Beta
- **Purpose:** Used only on a registered RHEL host to create a one-time image that has:
  - `sudo`, `python3`, `python3-pip`, `epel-release`, etc.
  - A preconfigured `ansible` user with passwordless sudo
- **Why:** Red Hat’s registry requires subscription access to install packages. This Dockerfile bakes everything in and pushes to [GHCR](https://ghcr.io) for reuse.
- **Where to build:** On a RHEL 10 host with subscription access.
- **Where to use:** Not recommended for direct use (pulling it requires Red Hat auth).

### `Dockerfile.rhel`
- **Base:** `ghcr.io/brett-odu/rhel10_ansible:latest`
- **Purpose:** A lightweight wrapper for CI/CD or local testing.
- **Use:** Anywhere — no RHEL subscription needed.
- **Why:** Reuses the prebuilt and published container from `Dockerfile.ubi10`.

---

## 📦 Image Naming and Organization

Container image names in this repo match the `ansible_host` values in `hosts.yml`. This allows clarity and consistency between inventory and image names.

We recommend using descriptive naming like `alma_ansible_sudoer` or `ubuntu_ansible_test`, but the key is to match what's defined in your inventory.

---

## 🚀 How to Use These in CI

1. Push built images to GHCR:
```bash
docker tag rhel10_ansible ghcr.io/your-username/rhel10_ansible:latest
docker push ghcr.io/your-username/rhel10_ansible:latest
```

2. In your GitHub Actions workflow:
```yaml
jobs:
  test:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/your-username/rhel10_ansible:latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v4
```

3. [Configure secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) for authentication to GHCR if needed (for private images).

---
