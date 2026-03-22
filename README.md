# Autonomous SOC Platform 🛡️

[![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0)
[![Docker Support](https://img.shields.io/badge/Docker-Supported-2496ED.svg)](https://www.docker.com/)
[![Architecture: Open-Core](https://img.shields.io/badge/Architecture-Open--Core-orange.svg)]()

## 📖 Overview

Standard SOC solutions are often black boxes with rigid pricing models. **Autonomous SOC Platform** will be designed to provide forensic-level visibility, automated incident response, and continuous cloud compliance without vendor lock-in. 

Built on the **MITRE ATT&CK** framework, this platform won't just alert you to a breach — it will automatically gathers evidence, isolates threats, and prepares a forensically sound package for legal and regulatory compliance.

## 🧠 The "Core Six" Stack

My architecture seamlessly integrates best-in-class open-source tools. 
**Current Release Status: Planning / Phase 0**

* ⚪ **Wazuh:** Core SIEM & EDR [Planned - Phase 1-2]
* ⚪ **StackStorm:** SOAR engine for automated playbooks [Planned - Phase 1-2]
* ⚪ **DFIR IRIS:** Case management and timeline building [Planned - Phase 1-2]
* ⚪ **Velociraptor:** Advanced endpoint forensics [Planned - Phase 5]
* ⚪ **OpenCTI / MISP:** Intelligence-driven brain [Planned - Phase 6]

*(Will be supported by Zabbix for health monitoring, Suricata for IDS/IPS, and Grafana for centralized dashboards).*

## 🚀 Key Features

### 1. Cloud Asset DNA (Modular Inventory & Drift Control)
Stop relying on static asset lists. My custom Python-based engine continuously queries APIs from AWS, Azure, GCP, and DigitalOcean to map your real infrastructure.
* **Auto-Deployment:** Detects unmanaged instances and automatically deploys security agents.
* **Drift Detection:** Instantly alerts and creates IRIS cases on dangerous configuration changes (e.g., public S3 buckets).

### 2. Forensic Fast-Track
Transition from "we have an alert" to "here is the evidence package" in a short period of time.
* **Auto-Triage:** Upon critical malware detection, StackStorm triggers Velociraptor to collect MFT, Amcache, Prefetch, and memory dumps *before* they are wiped.
* **Case Hydration:** All artifacts are automatically structured and uploaded to a dedicated DFIR IRIS case. Suitable for court and regulatory audits (Chain of Custody preserved).


## 🛣️ Roadmap

- [x] **Phase 0 (Design):** Architecture planning and Open-Core strategy.
- [ ] **Phase 1 (Core Three Foundation):** Building a stable, portable `docker-compose` bundle for the "Core Three" (Wazuh, StackStorm, DFIR IRIS) with proper data persistence and isolated networking.
- [ ] **Phase 2 (Core Integrations):** Establishing reliable API communication between the Core Three (e.g., Wazuh alerts trigger st2, st2 creates IRIS alerts/cases).
- [ ] **Phase 3 (Hardening):** Containers, services, and API security improvements (Least privilege, secret management).
- [ ] **Phase 4 (Cloud Asset Discovery):** Development of the custom `Cloud Asset DNA` Python engine for automated cloud infrastructure mapping.
- [ ] **Phase 5 (Forensic Fast-Track):** Integration of Velociraptor and development of automated incident response playbooks.
- [ ] **Phase 6 (Intelligence Layer):** Integration of Sigma Rules and OpenCTI/MISP for automated threat intelligence enrichment.
- [ ] **Phase 7 (Enterprise Scalability):** Developing Kubernetes deployment solutions (Helm charts) for AWS/GCP to support multi-tenant architectures.
- [ ] **Phase 8 (UI/UX):** Lightweight web control panel for inventory, system status management, and module installation.
- [ ] **Phase 9 (Observability & Network Defense):** Proactive integration of auxiliary infrastructure monitoring (Zabbix, Grafana) and network security tools (Suricata).
- [ ] **Phase 10 (Infrastructure as Code):** Full automation of the deployment and infrastructure management process using Ansible Tower/AWX.

## 🛠️ Getting Started
*(Installation instructions coming soon - Docker compose bundle in active development)*
