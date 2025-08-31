# OpenCircular

[![CI](https://github.com/opencircular/opencircular/workflows/CI/badge.svg)](https://github.com/opencircular/opencircular/actions)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

A production-ready AI provider connectivity platform that enables seamless integration with multiple AI services including Google Gemini and OpenAI-compatible endpoints.

## 🚀 Features

- **Multi-Provider Support**: Connect to Gemini, OpenAI, OpenRouter, Together, and custom OpenAI-compatible endpoints
- **Real-time Health Monitoring**: Active connectivity checks and latency monitoring for all providers
- **Interactive Playground**: Test AI providers with a clean, responsive chat interface
- **Production Ready**: Built with FastAPI + Next.js, containerized with Docker, deployed on Render
- **Type Safe**: Full TypeScript support on frontend, Python type hints on backend
- **CI/CD Pipeline**: Automated testing and deployment with GitHub Actions

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │    Backend      │    │  AI Providers   │
│   (Next.js)     │◄──►│   (FastAPI)     │◄──►│                 │
│                 │    │                 │    │ • Gemini        │
│ • Landing Page  │    │ • /api/ai/chat  │    │ • OpenAI        │
│ • Playground    │    │ • /health       │    │ • OpenRouter    │
│ • Health Status │    │ • /health/ai    │    │ • Together      │
└─────────────────┘    └─────────────────┘    │ • Custom        │
                                               └─────────────────┘
```

## 🚦 Quick Start

### Prerequisites

- Docker and Docker Compose
- Node.js 20+ (for local development)
- Python 3.11+ (for local development)
- AI Provider API Keys (see [Environment Variables](#environment-variables))

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/opencircular/opencircular.git
   cd opencircular
   ```

2. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your API keys
   ```

3. **Start the backend**
   ```bash
   cd backend
   pip install -e .[dev]
   uvicorn opencircular_backend.app:app --host 0.0.0.0 --port 8000 --reload
   ```

4. **Start the frontend** (in a new terminal)
   ```bash
   cd frontend
   npm install
   npm run dev
   ```

5. **Access the application**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8000
   - API Documentation: http://localhost:8000/docs

### Docker Development

```bash
# Build and run with Docker Compose
docker-compose up --build

# Access the application
# Frontend: http://localhost:3000
# Backend: http://localhost:8000
```

## 🌐 Deployment

### Deploy to Render

1. **Fork this repository**

2. **Connect to Render**
   - Go to [Render Dashboard](https://dashboard.render.com)
   - Click "New" → "Blueprint"
   - Connect your GitHub repository
   - Select the `render.yaml` file

3. **Configure Environment Variables**
   Set the following in your Render service settings:
   
   **Backend Service:**
   ```
   GEMINI_API_KEY=your_gemini_api_key_here
   OPENAI_API_KEY=your_openai_api_key_here
   AI_PROVIDER=gemini  # or openai, openrouter, together
   ```

4. **Deploy**
   - Render will automatically build and deploy both services
   - Your app will be available at the provided URLs

### Manual Deployment

For other platforms, use the provided Docker images:

```bash
# Build images
docker build -t opencircular-backend ./backend
docker build -t opencircular-frontend ./frontend

# Run containers
docker run -p 8000:8000 --env-file .env opencircular-backend
docker run -p 3000:3000 -e NEXT_PUBLIC_API_BASE=http://your-backend-url opencircular-frontend
```

## ⚙️ Environment Variables

### Backend Configuration

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `PORT` | Backend server port | `8000` | No |
| `CORS_ALLOWED_ORIGINS` | Comma-separated list of allowed origins | `http://localhost:3000` | No |
| `AI_PROVIDER` | Default AI provider | `gemini` | No |

### Gemini Configuration

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `GEMINI_API_KEY` | Google Gemini API key | - | Yes (if using Gemini) |
| `GEMINI_MODEL` | Gemini model name | `gemini-1.5-flash` | No |

### OpenAI-Compatible Configuration

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `OPENAI_API_KEY` | API key for OpenAI-compatible service | - | Yes (if using OpenAI-compatible) |
| `OPENAI_BASE_URL` | Base URL for OpenAI-compatible API | `https://api.openai.com/v1` | No |
| `OPENAI_MODEL` | Model name | `gpt-4o-mini` | No |

### Frontend Configuration

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `NEXT_PUBLIC_API_BASE` | Backend API base URL | `http://localhost:8000` | No |

### Provider-Specific URLs

For different providers, set `OPENAI_BASE_URL` to:

- **OpenAI**: `https://api.openai.com/v1` (default)
- **OpenRouter**: `https://openrouter.ai/api/v1`
- **Together**: `https://api.together.xyz/v1`
- **Local vLLM**: `http://localhost:8000/v1`
- **Local Ollama**: `http://localhost:11434/v1`

## 🔧 API Reference

### Chat Endpoint

**POST** `/api/ai/chat`

```json
{
  "messages": [
    {"role": "user", "content": "Hello, how are you?"}
  ]
}
```

**Response:**
```json
{
  "reply": "Hello! I'm doing well, thank you for asking. How can I help you today?"
}
```

### Health Endpoints

**GET** `/health` - Basic health check

```json
{"status": "ok"}
```

**GET** `/health/ai` - AI providers health check

```json
{
  "providers": [
    {
      "provider": "gemini",
      "ok": true,
      "latency_ms": 245.67,
      "response": "7"
    },
    {
      "provider": "openai-compat",
      "ok": false,
      "error": "Not configured (missing OPENAI_API_KEY)"
    }
  ]
}
```

## 🧪 Testing

### Backend Tests

```bash
cd backend
pip install -e .[dev]
pytest tests/ -v
```

### Frontend Type Checking

```bash
cd frontend
npm install
npm run type-check
```

### Integration Testing

```bash
# Start services
docker-compose up -d

# Test health endpoints
curl http://localhost:8000/health
curl http://localhost:8000/health/ai

# Test chat endpoint
curl -X POST http://localhost:8000/api/ai/chat \
  -H "Content-Type: application/json" \
  -d '{"messages": [{"role": "user", "content": "Say exactly: OpenCircular OK"}]}'
```

## 📁 Project Structure

```
.
├── README.md
├── CONTRIBUTING.md
├── SECURITY.md
├── GOVERNANCE.md
├── LICENSE
├── .env.example
├── render.yaml                    # Render deployment config
├── .github/
│   └── workflows/
│       └── ci.yml                 # GitHub Actions CI
├── backend/
│   ├── pyproject.toml             # Python dependencies
│   ├── Dockerfile
│   ├── uvicorn_start.sh
│   ├── src/opencircular_backend/
│   │   ├── __init__.py
│   │   ├── app.py                 # FastAPI application
│   │   ├── providers/
│   │   │   ├── __init__.py
│   │   │   ├── base.py            # Provider protocol
│   │   │   ├── gemini.py          # Gemini implementation
│   │   │   └── openai_compat.py   # OpenAI-compatible implementation
│   │   └── routes/
│   │       ├── __init__.py
│   │       ├── ai.py              # Chat endpoints
│   │       └── health.py          # Health endpoints
│   └── tests/
│       └── test_health.py
└── frontend/
    ├── package.json
    ├── next.config.js
    ├── tsconfig.json
    ├── Dockerfile
    ├── .dockerignore
    ├── app/
    │   ├── layout.tsx
    │   ├── page.tsx               # Landing page
    │   ├── globals.css
    │   ├── playground/
    │   │   └── page.tsx           # Chat playground
    │   └── health/
    │       └── page.tsx           # Health dashboard
    └── lib/
        └── api.ts                 # API client functions
```

## 🔒 Security

- API keys are never committed to the repository
- CORS is configured to allow only specified origins
- Input validation on all endpoints
- Request size limits (4KB for chat requests)
- Health checks use minimal test prompts
- Timeouts on all external API calls

For security issues, please see [SECURITY.md](SECURITY.md).

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Development Workflow

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Run tests: `npm test` (frontend) and `pytest` (backend)
5. Commit using conventional commits: `git commit -m 'feat: add amazing feature'`
6. Push to your branch: `git push origin feature/amazing-feature`
7. Open a Pull Request

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [FastAPI](https://fastapi.tiangolo.com/) for the excellent Python web framework
- [Next.js](https://nextjs.org/) for the React framework
- [Render](https://render.com/) for simple cloud deployment
- [Google Gemini](https://ai.google.dev/) and [OpenAI](https://openai.com/) for AI capabilities

## 📞 Support

- 📖 [Documentation](https://github.com/opencircular/opencircular/wiki)
- 🐛 [Issue Tracker](https://github.com/opencircular/opencircular/issues)
- 💬 [Discussions](https://github.com/opencircular/opencircular/discussions)
- 📧 [Email](mailto:support@opencircular.org)

---

**Built with ❤️ by the OpenCircular team**
