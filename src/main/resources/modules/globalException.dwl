%dw 2.0
output application/json
---
{
	"x-correlation-id": correlationId,
	"x-transaction-id": vars.commonStandardVars.'x-transaction-id',
	node: app.name,
	environment: p('mule.env') default "dev",
	errorType: error.errorType.asString default "INTERNAL_SERVER_ERROR",
	errorMessage: error.description,
    erroredComponent: error.failingComponent
}