#!/bin/bash
set -e

# Start uvicorn with the FastAPI app
exec uvicorn opencircular_backend.app:app --host 0.0.0.0 --port ${PORT:-8000}
