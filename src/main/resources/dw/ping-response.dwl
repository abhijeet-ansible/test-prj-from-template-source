%dw 2.0
output application/json
---
{ 
     dependentApiResponse: "N/A",
     status: "200",
     transactionId: vars.commonStandardVars.transactionId ,
     node: app.name,
     env: p('mule.env'),
     message: "alive"
}