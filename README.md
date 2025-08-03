# local_gpu_batch

Project scaffolding for running large language model (LLM) batch jobs on a local GPU using containerized services.

## Overview

This repository provides a minimal setup for running a backend API and accompanying frontend for submitting batch inference tasks. Model weights are stored locally and mounted into the containers at runtime so workloads can be executed without external connectivity.

## Prerequisites

Before starting the services, ensure the following software and hardware are available:

- **Docker** and **Docker Compose** installed on your host machine.
- **NVIDIA GPU** with recent drivers and CUDA libraries (11.x or later recommended).
- Adequate GPU memory for the models you plan to run (8GB+ suggested).
- Optional: `curl` for making API requests during development.

## Directory Layout

The project expects the following structure at the repository root:

```
.
├── backend/    # FastAPI or similar service exposing batch endpoints
├── frontend/   # Web UI for submitting jobs and tracking progress
└── models/     # Local model weights
```

Place downloaded model files (e.g., `model.bin`, `tokenizer.json`) inside the `models/` directory. These files will be mounted into the backend container at `/app/models` by the compose configuration.

## Running the Docker Services

1. Populate the `models/` directory with the required model files.
2. From the repository root, build and start the stack:

   ```bash
   docker compose up --build
   ```

   The frontend will typically be accessible at <http://localhost:3000>, and the backend API at <http://localhost:8000>.
3. When finished, stop the services with:

   ```bash
   docker compose down
   ```

## Sample API Usage

Submit a batch inference request to the backend using `curl`:

```bash
curl -X POST \
  http://localhost:8000/batch \
  -H "Content-Type: application/json" \
  -d '{"inputs": ["Hello world", "Another request"]}'
```

The response will contain model outputs for each provided input.

## Development Notes

- Rebuild images when dependencies change using `docker compose build`.
- Mount source code directories in development mode to enable hot reloads (adjust compose file accordingly).
- Use environment files such as `.env` to manage secrets and configurable parameters.

## System Requirements

- Linux, macOS, or Windows with WSL2.
- NVIDIA GPU drivers compatible with the CUDA version inside the containers.
- Sufficient disk space for large model files and Docker images.

