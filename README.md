# TeamCity PHP Agent Docker Images

Docker images for TeamCity build agents with PHP support, based on the official JetBrains TeamCity agent images.

## Features

- Based on `jetbrains/teamcity-agent` official images
- Multiple PHP versions supported (8.2, 8.3, 8.4)
- Includes Composer, Docker CLI, Terraform, and AWS CLI
- Configurable TeamCity agent and PHP versions
- Automated builds via GitHub Actions

## Quick Start

### Pull from Docker Hub

```bash
# Latest image (TeamCity 2025.11.1, PHP 8.4)
docker pull clegginabox/teamcity-php-agent:latest

# Specific PHP version
docker pull clegginabox/teamcity-php-agent:php-8.3

# Specific TeamCity and PHP version
docker pull clegginabox/teamcity-php-agent:teamcity-2025.11.1-php-8.2
```

## Building Locally

### Build with Default Versions

```bash
docker build -t teamcity-php-agent .
```

### Build with Custom Versions

```bash
docker build \
  --build-arg TEAMCITY_VERSION=2025.11.1 \
  --build-arg PHP_VERSION=8.3 \
  -t teamcity-php-agent:custom .
```

## Docker Image Tags

The following tags are created:

- `latest` - Latest TeamCity version with PHP 8.4 (only on main branch)
- `php-X.X` - Latest TeamCity version with specific PHP version (only on main branch)
- `teamcity-X.X.X-php-X.X` - Specific TeamCity and PHP version combination

## Installed Tools

Each image includes:

- **PHP** (configurable version: 8.2, 8.3, or 8.4) with extensions:
  - cli, curl, dom, grpc, intl, mbstring, xml
- **Composer** (latest)
- **Docker CLI** (latest)
- **Terraform** (latest)
- **AWS CLI** (v2)

## License

This repository configuration is provided as-is for building TeamCity agent images with PHP support.
