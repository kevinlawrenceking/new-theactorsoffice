<cftry>
   
    <cfset systemnames = createObject("component", "services.SystemService").SELfusystems_24634()>
    

    <cfif NOT isQuery(systemnames) OR systemnames.recordCount EQ 0>
        <cfthrow message="The query returned no results or was not executed properly.">
    </cfif>
    
<cfcatch type="any">

    <cflog file="errorLog" text="[Error in systemnames_453_2.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
