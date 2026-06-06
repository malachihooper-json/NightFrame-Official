# Orchestrator

## Central Mesh Coordinator

The Orchestrator serves as the central hub of the NIGHTFRAME mesh network, managing node registration, task distribution, and the system's credit ledger.

## Core Services

- Shard Coordinator: Manages the partitioning and distribution of neural network shards across the mesh.
- Drone Registry: Maintains real-time status of connected nodes, including hardware profiles and probationary status.
- Ledger Service: Performs cryptographic verification of compute results and maintains the credit-based economy.
- Cell Coordinator: Synchronizes cellular telemetry from scout nodes to generate global RF maps.

## Communication Interfaces

- gRPC (Port 5001): Primary bidirectional streaming interface for node-to-node and node-to-orchestrator communication.
- SignalR Hub: Provides high-frequency telemetry updates to administrative consoles.
- REST API: Standard endpoints for mesh status, task submission, and administrative control.