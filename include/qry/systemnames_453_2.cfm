<cftry>
    <!--- Instantiate the SystemService component --->
    <cfset systemService = createObject("component", "services.SystemService")>
    
    <!--- Call the SELfusystems_24634 function to get the query --->
    <cfset variables.systemNAMES = systemService.SELfusystems_24634()>
    
    <!--- Validate that systemNAMES is a query and has records --->
    <cfif NOT isQuery(variables.systemNAMES) OR variables.systemNAMES.recordCount EQ 0>
        <cfthrow message="The query returned no results or was not executed properly.">
    </cfif>
    
<cfcatch type="any">
    <!--- Log the error for debugging purposes --->
    <cflog file="errorLog" text="[Error in systemnames_453_2.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
