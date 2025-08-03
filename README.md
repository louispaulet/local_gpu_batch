# local_gpu_batch

Local LLM batch process

## Backend

Build the FastAPI backend and run it with the model directory mounted:

```bash
docker build -t local-backend backend
docker run -v $(pwd)/models:/models -p 8000:8000 local-backend
```

Place your GGUF model file inside the `models/` directory. The server exposes a POST `/generate` endpoint that accepts a JSON body with a `prompt` field and returns generated text.
