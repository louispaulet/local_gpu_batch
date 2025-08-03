from fastapi import FastAPI
from pydantic import BaseModel
from llama_cpp import Llama
import os

MODEL_PATH = os.environ.get("MODEL_PATH", "/models/model.gguf")
llm = Llama(model_path=MODEL_PATH)

app = FastAPI()

class GenerateRequest(BaseModel):
    prompt: str

@app.post("/generate")
def generate(req: GenerateRequest):
    """Generate text for a given prompt using the loaded model."""
    result = llm.create_completion(prompt=req.prompt)
    text = result["choices"][0]["text"]
    return {"text": text}
