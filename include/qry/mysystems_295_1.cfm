<!--- Instantiate the SystemService component --->
<cfset systemService = createObject("component", "services.SystemService")>

<!--- Set the system IDs as a comma-delimited string --->
<cfset systemIds = "5,6,1,2,3,4">

<!--- Call the SELfusystems_24320 function with systemIds --->
<cfset mysystems = systemService.SELfusystems_24320(systemIds=systemIds)>
