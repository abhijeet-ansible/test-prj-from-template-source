# Usage Guide

This guide explains how to use the core features of the IEM API Mule Template.

## Using the APIkit Router

The template is pre-configured with a RAML-based APIkit router. To update the interface:
1. Update your RAML in `src/main/resources/api`.
2. Right-click the RAML file > Mule > Generate Flows from Local RAML.

## Implementing New Logic

1. Create a new XML file in `src/main/mule/implementation/`.
2. Define your business logic in a `sub-flow`.
3. Reference this sub-flow from the interface flows in `api.xml` using a `flow-ref`.

## Handling Errors

The `api-error-handler` in `exception.xml` uses the `module-error-handler-plugin`. 
- To add custom error types, update the plugin configuration in `global.xml`.
- To bypass global handling for a specific flow, use a local `error-handler` block.

## Configuration Properties

Properties are managed via:
- `common.yaml`: App name, base path, and common settings.
- `config-dev.yaml`, `config-prod.yaml`, etc.: Ports, hostnames, and credentials.

Example `common.yaml`:
```yaml
common:
  app:
    name: "your-api-name"
    basePath: "/api/v1/*"
```

## Transaction Tracking

The template automatically extracts `x-transaction-id` from the request header. If missing, it generates a new UUID.
- Always propagate this ID in downstream HTTP or MQ calls.
- Use `vars.commonStandardVars.'x-transaction-id'` to access it in DataWeave.
