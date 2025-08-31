# Security Policy

## Supported Versions

We release patches for security vulnerabilities. Which versions are eligible for receiving such patches depends on the CVSS v3.0 Rating:

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |
| < 0.1   | :x:                |

## Reporting a Vulnerability

We take the security of OpenCircular seriously. If you believe you have found a security vulnerability, please report it to us as described below.

**Please do not report security vulnerabilities through public GitHub issues.**

Instead, please report them via email to:

**security@opencircular.org**

You should receive a response within 48 hours. If for some reason you do not, please follow up via email to ensure we received your original message.

Please include the requested information listed below (as much as you can provide) to help us better understand the nature and scope of the possible issue:

* Type of issue (e.g. buffer overflow, SQL injection, cross-site scripting, etc.)
* Full paths of source file(s) related to the manifestation of the issue
* The location of the affected source code (tag/branch/commit or direct URL)
* Any special configuration required to reproduce the issue
* Step-by-step instructions to reproduce the issue
* Proof-of-concept or exploit code (if possible)
* Impact of the issue, including how an attacker might exploit the issue

This information will help us triage your report more quickly.

## Preferred Languages

We prefer all communications to be in English.

## Security Measures

OpenCircular implements several security measures:

### API Security

- **Input Validation**: All API endpoints validate input data
- **Request Size Limits**: Chat requests are limited to 4KB to prevent abuse
- **CORS Configuration**: Cross-origin requests are restricted to configured origins
- **Rate Limiting**: (Planned) API rate limiting to prevent abuse

### Authentication & Authorization

- **API Key Management**: AI provider API keys are stored as environment variables
- **No Persistent Storage**: No user data or API keys are stored in databases
- **Environment Isolation**: Secrets are isolated from application code

### Infrastructure Security

- **Container Security**: Docker containers run with non-root users
- **Network Security**: Services communicate over HTTPS in production
- **Dependency Management**: Regular dependency updates and vulnerability scanning

### Data Protection

- **No Data Persistence**: Chat messages are not stored or logged
- **Minimal Data Collection**: Only necessary data is processed
- **API Key Isolation**: Provider API keys are never exposed to frontend

## Security Best Practices for Users

### API Key Management

- **Never commit API keys** to version control
- **Use environment variables** for all sensitive configuration
- **Rotate API keys regularly** according to provider recommendations
- **Use least-privilege access** when possible

### Deployment Security

- **Use HTTPS** for all production deployments
- **Configure CORS** to allow only necessary origins
- **Monitor logs** for suspicious activity
- **Keep dependencies updated** regularly

### Development Security

- **Use `.env` files** for local development (never commit these)
- **Validate all inputs** in custom provider implementations
- **Follow secure coding practices** when contributing

## Known Security Considerations

### AI Provider Risks

- **Data Transmission**: Messages are sent to third-party AI providers
- **Provider Policies**: Subject to individual provider data handling policies
- **API Key Exposure**: Misconfigured deployments could expose API keys

### Mitigation Strategies

- **Environment Variable Management**: All secrets are managed through environment variables
- **No Logging of Sensitive Data**: API keys and user messages are not logged
- **Provider Selection**: Users can choose providers based on their security requirements

## Vulnerability Disclosure Timeline

When we receive a security bug report, we will:

1. **Acknowledge receipt** within 48 hours
2. **Investigate and validate** the vulnerability within 7 days
3. **Develop and test a fix** within 14 days (for critical issues)
4. **Release a security patch** and notify users
5. **Publicly disclose** the vulnerability after users have had time to update

## Security Updates

Security updates will be:

- **Released as patch versions** (e.g., 0.1.1, 0.1.2)
- **Documented in release notes** with severity information
- **Announced via GitHub releases** and security advisories
- **Communicated to users** through appropriate channels

## Scope

This security policy applies to:

- The OpenCircular backend API
- The OpenCircular frontend application
- Docker containers and deployment configurations
- Documentation and example configurations

**Out of scope:**

- Third-party AI provider services (report to respective providers)
- User-deployed instances (users are responsible for their deployments)
- Dependencies (report to respective maintainers)

## Security Contact

For security-related questions or concerns:

- **Email**: security@opencircular.org
- **Response Time**: Within 48 hours
- **Encryption**: PGP key available upon request

## Acknowledgments

We would like to thank the following individuals for their responsible disclosure of security vulnerabilities:

*(This section will be updated as we receive and address security reports)*

## Legal

By reporting security vulnerabilities to us, you agree to:

- **Act in good faith** to avoid privacy violations and disruption to others
- **Not access or modify data** that does not belong to you
- **Not perform testing** that could harm or disrupt our services
- **Not publicly disclose** the vulnerability until we have addressed it

We commit to:

- **Work with you** to understand and resolve the issue quickly
- **Keep you informed** of our progress throughout the process
- **Credit you** for the discovery (if desired) when we publicly disclose
- **Not pursue legal action** against researchers who follow this policy

---

**Last Updated**: December 2024

This security policy may be updated from time to time. Please check back regularly for the most current version.
