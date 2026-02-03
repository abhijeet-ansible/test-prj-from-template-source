# IEM API Mule Template

This template provides a standardized starting point for building Mule 4 APIs within the IEM ecosystem. It includes pre-configured error handling, logging, security, and project structure to ensure consistency across all integration projects.

## Key Features

- **Standardized Project Structure**: Follows MuleSoft best practices for naming and folder organization.
- **Centralized Error Handling**: Integrates with the `iem-api-common-error-handler` for consistent error responses.
- **Structured Logging**: Uses `json-logger` for high-performance, machine-readable logs.
- **Secure Configuration**: Pre-configured for Secure Properties and Anypoint MQ.
- **Automation Scripts**: Includes `setup-project.sh` to quickly bootstrap new projects from this template.
- **Transaction Tracking**: Automatic generation and propagation of `x-transaction-id` across flows.

## Pre-requisites

- **Mule Runtime**: 4.6.0 or higher.
- **Java Version**: Java 17.
- **Anypoint Studio**: 7.15 or higher.
- **Maven**: 3.8.x or higher.

## Getting Started

### 1. Bootstrap a New Project
Use the included script to create a new project based on this template:

#### macOS / Linux (Bash)
```bash
chmod +x setup-project.sh
./setup-project.sh <new_project_name> [org_id]
```

#### Windows (PowerShell)
```powershell
.\setup-project.ps1 -NewProjectName <new_project_name> [-OrgId <org_id>]
```

This script will:
- Clone the template into a new directory.
- Rename the Artifact ID, Project Name, and Application Name.
- Update the Group ID (if provided).
- Update log file names and configuration references.

### 2. Import into Anypoint Studio
1. File > Import > Anypoint Studio > Existing Anypoint Studio Project.
2. Select the directory created by the script.

## Project Structure

- `src/main/mule/api.xml`: APIkit Router and interface flows.
- `src/main/mule/global.xml`: Global configurations and connectors.
- `src/main/mule/exception.xml`: Error handling logic.
- `src/main/mule/implementation/`: Sub-flows for business logic.
- `src/main/resources/config/`: Environment-specific YAML properties.
- `src/main/resources/dw/`: Reusable DataWeave transformations.

## Standards & Conventions

### Logging
Always use the `JSON Logger` for production logs.
- Category: `iem.custom.debug` for trace/debug info.
- Include `x-transaction-id` in all log messages.

### Error Handling
Errors are caught by the `api-error-handler` which processes them and returns a standardized JSON response.

### Properties
- Use `common.yaml` for environment-agnostic properties.
- Use `config-${mule.env}.yaml` for environment-specific values.
- Secure properties must be encrypted using the Blowfish/CBC algorithm.

## Support
For issues or feature requests, contact the IEM Integration Team.
