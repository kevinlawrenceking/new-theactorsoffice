 
    <!--- Instantiate the SystemService component --->
    <cfset systemService = createObject("component", "services.SystemService")>
    
    <!--- Call the SELfusystems_24634 function to get the query --->
    <cfset variables.systemNAMES = systemService.SELfusystems_24634()>Ha<cfabort>
    
 