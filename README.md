# local_gpu_batch
Local LLM batch process

## Usage

Convenience commands are provided via the `Makefile`:

- `make build` – build Docker images
- `make up` – start services in the background
- `make down` – stop and remove containers
- `make pull-models` – download model weights (uses `huggingface-cli` and writes to `models/`)
- `make clean` – remove containers and prune unused Docker data

Set the `MODELS` environment variable to control which Hugging Face models are fetched when running `make pull-models`.
