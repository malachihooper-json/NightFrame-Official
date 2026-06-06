# NIGHTFRAME

![GitHub Release](https://img.shields.io/github/v/release/malachihooper/NightFrame?style=flat-square)
![License](https://img.shields.io/badge/license-Proprietary-blue?style=flat-square)

**NIGHTFRAME** is a research prototype for cooperative edge intelligence, enabling heterogeneous devices (e.g., smartphones, desktops, IoT nodes) to form a capability‑aware mesh for shared computation and connectivity.

NIGHTFRAME is a research prototype for cooperative edge intelligence. It
combines a metadata-routing orchestrator, heterogeneous compute nodes, local
mesh discovery, cellular telemetry, RF fingerprinting, and a contribution
ledger.

The repository contains implemented prototypes and explicitly unfinished
research paths. Read [Project Status](#project-status) before deployment.

## Repository Map

| Path | Purpose | Portability |
|---|---|---|
| `Shared/` | Cross‑component interfaces | .NET 8, cross‑platform |
| `Orchestrator/` | ASP.NET Core REST, SignalR, and gRPC coordination | .NET 8, cross‑platform |
| `Drone/` | Desktop compute, mesh, cellular, and gateway node | .NET 8; some features require platform privileges |
| `Watchdog/` | Process supervisor prototype | .NET 8; publish target chosen by operator |
| `Agent3/`, `GAMMA1Console/` | Legacy Windows agent and console | Windows only |
| `DroneAndroid/` | Android scout prototype | Requires the .NET Android workload and signing setup for release |
| `gamma1-web/` | Next.js administrative console | Node.js |
| `WebConsole/` | Expo/React Native console prototype | Node.js and Expo |
| `training/` | Python training and metacognitive experiments | Python; optional dependencies vary by script |
| `docs/WHITEPAPER.md` | Pandoc‑ready conceptual white paper (ArXiv/Zenodo) | Pandoc 3 recommended |

| Path | Purpose | Portability |
|---|---|---|
| `Shared/` | Cross-component interfaces | .NET 8, cross-platform |
| `Orchestrator/` | ASP.NET Core REST, SignalR, and gRPC coordination | .NET 8, cross-platform |
| `Drone/` | Desktop compute, mesh, cellular, and gateway node | .NET 8; some features require platform privileges |
| `Watchdog/` | Process supervisor prototype | .NET 8; publish target chosen by operator |
| `Agent3/`, `GAMMA1Console/` | Legacy Windows agent and console | Windows only |
| `DroneAndroid/` | Android scout prototype | Requires the .NET Android workload and signing setup for release |
| `gamma1-web/` | Next.js administrative console | Node.js |
| `WebConsole/` | Expo/React Native console prototype | Node.js and Expo |
| `training/` | Python training and metacognitive experiments | Python; optional dependencies vary by script |
| `docs/WHITEPAPER.md` | Pandoc/Zenodo-ready conceptual white paper | Pandoc 3 recommended |

## Prerequisites

- **.NET SDK 8.0.400** or later
- **Node.js 20+** for JavaScript components
- **Pandoc 3** (or newer) to generate PDF/DOCX from the white paper
- Optional: PowerShell 7, Python 3, Android workload, modem hardware, and platform networking privileges

- .NET SDK 8.0.400 or a later .NET 8 patch
- Node.js 20 or later for JavaScript applications
- Pandoc 3 to export the white paper
- Optional: PowerShell 7, Python 3, Android workload, modem hardware, and
  platform networking privileges

## Reproducible Build

The core, cross‑platform solution can be built without the Windows‑only UI:

```bash
# Restore and build the core solution
 dotnet restore NIGHTFRAME.Core.sln
 dotnet build NIGHTFRAME.Core.sln --no-restore
```

On Windows, build the full solution (including legacy UI):

```powershell
 dotnet restore NIGHTFRAME.sln
 dotnet build NIGHTFRAME.sln --no-restore
```

### Web console

```bash
cd gamma1-web
npm ci   # install exact lockfile dependencies
npm run build   # production bundle
```

The portable core solution excludes the Windows-only legacy UI:

```bash
dotnet restore NIGHTFRAME.Core.sln
dotnet build NIGHTFRAME.Core.sln --no-restore
```

On Windows, build every desktop project with:

```powershell
dotnet restore NIGHTFRAME.sln
dotnet build NIGHTFRAME.sln --no-restore
```

Build the web console from its lockfile:

```bash
cd gamma1-web
npm ci
npm run build
```

Run a local orchestrator and a receive-only Drone in separate terminals:

```bash
dotnet run --project Orchestrator
dotnet run --project Drone -- --no-hosting --no-cellular
```

`--no-hosting` avoids requesting hotspot/gateway behavior. Hosting and cellular
features require informed operator consent, suitable hardware, and OS/network
permissions.

## Configuration

The Drone resolves the orchestrator address in this order:

1. `--orchestrator <url>`
2. `NIGHTFRAME_ORCHESTRATOR`
3. local `config.txt`
4. `http://localhost:5000`

Local identities, configuration, signing keys, generated databases, caches, and
model state are ignored by Git. Do not commit them.

Android debug builds do not require a private signing key. A release build uses
`DroneAndroid/nightframe.keystore` only when that file exists and expects
`NIGHTFRAME_KEYSTORE_PASS`.

## Project Status

Implemented prototype mechanisms include:

- gRPC registration, heartbeat streaming, shard requests, and result submission
- capability-based node role assignment and probation state
- layer-range inference-job scheduling and ONNX/fallback execution
- LiteDB-backed contribution accounting
- UDP/mDNS discovery experiments and network simulation tools
- cellular measurement aggregation, K-nearest-neighbor RF localization, and
  rule-based/ONNX handover prediction
- explicit consent flow and resource-limit definitions for gateway operation

Important incomplete or unvalidated mechanisms include:

- compute-result signature verification and production consensus
- secure peer-to-peer update transport and model hydration
- end-to-end prompt completion/result decoding
- production authentication/authorization, TLS policy, and secret management
- reproducible real-world performance, RF accuracy, scale, and security results
- broad cross-platform behavior for privileged hotspot and gateway operations

Treat NIGHTFRAME as research software. Do not expose the Orchestrator publicly
or enable network-sharing features without an independent security, legal, and
operational review.

## Research Paper Export

The white paper can be rendered with a single Pandoc command. The repository includes a **Makefile** target for convenience:

```bash
make whitepaper   # produces PDF and DOCX in the project root
```

If you prefer a manual invocation:

```bash
pandoc docs/WHITEPAPER.md \
  --from markdown+tex_math_dollars \
  --standalone \
  --citeproc \
  -o NIGHTFRAME-whitepaper.pdf
```

```bash
pandoc docs/WHITEPAPER.md \
  --from markdown+tex_math_dollars \
  --standalone \
  --citeproc \
  -o NIGHTFRAME-whitepaper.pdf
```

For a DOCX deposit:

```bash
pandoc docs/WHITEPAPER.md --standalone -o NIGHTFRAME-whitepaper.docx
```

## Citation and License

Citation metadata is provided in [`CITATION.cff`](CITATION.cff). When referencing this work, please use the following BibTeX entry (generated from the CFF file):

```bibtex
@software{NightFrame2026,
  title        = {NIGHTFRAME: A Capability‑Aware Platform for Cooperative Edge Intelligence},
  author       = {Hooper, Malachi},
  year         = {2026},
  month        = {06},
  version      = {2.0.0},
  url          = {https://github.com/malachihooper/NightFrame},
  doi          = {10.5281/zenodo.XXXXXX},
}
```

The repository is **proprietary**; all rights are reserved. See the accompanying [`LICENSE`](LICENSE) for details.

Citation metadata is provided in [`CITATION.cff`](CITATION.cff). This repository
is proprietary and all rights are reserved; see [`LICENSE`](LICENSE).
