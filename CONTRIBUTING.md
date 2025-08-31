# Contributing to OpenCircular

We love your input! We want to make contributing to OpenCircular as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

## Development Process

We use GitHub to host code, to track issues and feature requests, as well as accept pull requests.

## Pull Requests

Pull requests are the best way to propose changes to the codebase. We actively welcome your pull requests:

1. Fork the repo and create your branch from `main`.
2. If you've added code that should be tested, add tests.
3. If you've changed APIs, update the documentation.
4. Ensure the test suite passes.
5. Make sure your code follows the existing style.
6. Issue that pull request!

## Conventional Commits

We use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages. This leads to more readable messages that are easy to follow when looking through the project history.

### Commit Message Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to our CI configuration files and scripts
- **chore**: Other changes that don't modify src or test files
- **revert**: Reverts a previous commit

### Examples

```
feat(providers): add support for Anthropic Claude API
fix(health): resolve timeout issues in provider health checks
docs(readme): update deployment instructions for Render
test(api): add integration tests for chat endpoint
```

## Development Setup

### Prerequisites

- Python 3.11+
- Node.js 20+
- Docker (optional, for containerized development)
- Git

### Backend Development

1. **Clone and setup**
   ```bash
   git clone https://github.com/opencircular/opencircular.git
   cd opencircular/backend
   ```

2. **Create virtual environment**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -e .[dev]
   ```

4. **Set up environment**
   ```bash
   cp ../.env.example .env
   # Edit .env with your API keys
   ```

5. **Run tests**
   ```bash
   pytest tests/ -v
   ```

6. **Start development server**
   ```bash
   uvicorn opencircular_backend.app:app --host 0.0.0.0 --port 8000 --reload
   ```

### Frontend Development

1. **Setup**
   ```bash
   cd frontend
   npm install
   ```

2. **Start development server**
   ```bash
   npm run dev
   ```

3. **Run type checking**
   ```bash
   npm run type-check
   ```

4. **Build for production**
   ```bash
   npm run build
   ```

## Code Style

### Python (Backend)

- We use [Black](https://black.readthedocs.io/) for code formatting
- [isort](https://pycqa.github.io/isort/) for import sorting
- [mypy](https://mypy.readthedocs.io/) for type checking
- Maximum line length: 100 characters

**Format code:**
```bash
black src/ tests/
isort src/ tests/
mypy src/
```

### TypeScript (Frontend)

- We use TypeScript strict mode
- ESLint with Next.js configuration
- Prettier for formatting (integrated with ESLint)

**Check code:**
```bash
npm run lint
npm run type-check
```

## Testing Guidelines

### Backend Tests

- Write tests for all new features and bug fixes
- Use pytest for testing
- Mock external API calls in tests
- Aim for high test coverage

**Test structure:**
```python
def test_feature_description():
    """Test that feature works as expected."""
    # Arrange
    setup_data = create_test_data()
    
    # Act
    result = function_under_test(setup_data)
    
    # Assert
    assert result.status == "expected_status"
```

### Frontend Tests

- Test user interactions and API integrations
- Use React Testing Library patterns
- Mock API calls appropriately

## Adding New AI Providers

To add support for a new AI provider:

1. **Create provider implementation**
   ```python
   # backend/src/opencircular_backend/providers/new_provider.py
   from .base import AIProvider
   
   class NewProvider:
       def __init__(self):
           # Initialize with API keys and configuration
           pass
       
       async def chat(self, messages):
           # Implement chat functionality
           pass
       
       async def health_check(self):
           # Implement health check
           pass
   ```

2. **Update provider factory**
   - Add provider to `get_provider()` function in `routes/ai.py`
   - Add health check logic in `routes/health.py`

3. **Update documentation**
   - Add environment variables to README.md
   - Update .env.example

4. **Add tests**
   - Create tests for the new provider
   - Test both success and failure scenarios

## Documentation

- Keep README.md up to date
- Document new environment variables
- Update API documentation for new endpoints
- Include examples in docstrings

## Issue and Bug Reports

We use GitHub issues to track public bugs. Report a bug by [opening a new issue](https://github.com/opencircular/opencircular/issues/new).

**Great Bug Reports** tend to have:

- A quick summary and/or background
- Steps to reproduce
  - Be specific!
  - Give sample code if you can
- What you expected would happen
- What actually happens
- Notes (possibly including why you think this might be happening, or stuff you tried that didn't work)

## Feature Requests

We welcome feature requests! Please:

1. Check if the feature already exists or is planned
2. Open an issue with the "enhancement" label
3. Describe the feature and its use case
4. Consider contributing the implementation

## Security Issues

Please do not report security vulnerabilities through public GitHub issues. Instead, please report them via email to security@opencircular.org.

## License

By contributing, you agree that your contributions will be licensed under the Apache License 2.0.

## Code of Conduct

### Our Pledge

We pledge to make participation in our project a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards

**Positive behavior includes:**
- Using welcoming and inclusive language
- Being respectful of differing viewpoints and experiences
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards other community members

**Unacceptable behavior includes:**
- The use of sexualized language or imagery
- Trolling, insulting/derogatory comments, and personal or political attacks
- Public or private harassment
- Publishing others' private information without explicit permission
- Other conduct which could reasonably be considered inappropriate in a professional setting

### Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by contacting the project team at conduct@opencircular.org.

## Questions?

Don't hesitate to ask questions! You can:

- Open an issue with the "question" label
- Start a discussion in [GitHub Discussions](https://github.com/opencircular/opencircular/discussions)
- Reach out to maintainers directly

## Recognition

Contributors will be recognized in:

- The project README
- Release notes for significant contributions
- The project's contributors page

Thank you for contributing to OpenCircular! 🎉
