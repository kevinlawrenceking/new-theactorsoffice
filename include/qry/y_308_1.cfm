
<cftry>
    <cfset filters = structNew()>
    <cfif isfix is "Y">
        <cfset filters["id"] = recordid>
    <cfelse>
        <cfset filters["uploadid"] = new_uploadid>
    </cfif>

    <cfset y = createObject("component", "services.AuditionImportService").getauditionsimport(filters=filters)>
    
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in y_308_1.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
