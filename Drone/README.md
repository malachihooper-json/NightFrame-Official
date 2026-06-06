# Drone

## Core Modules

- Compute Infrastructure: ONNX Runtime with hardware acceleration (CUDA, DirectML, CoreML)
- Cellular Intelligence: Serial AT-command interface for RF modems; supports RF fingerprinting and handover prediction
- Autonomous Networking: UDP/mDNS peer discovery; secure gRPC channels to Orchestrator
- Propagation Logic: Platform-aware captive portals for automated node onboarding

## Configuration

Node identity uses ECDSA keys generated on first run; keys sign all telemetry and results.

## Hardware Interfacing

- Neural Accelerators: Auto-detect available compute providers
- LTE/5G Modems: Serial (COM/tty) communication