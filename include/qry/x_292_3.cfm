
<cftry>
    <cfset allFieldsService = new "/services/AllFieldsService.cfc"()>
    <cfset x = allFieldsService.getFilteredAllFields("pri", "auto_increment")>
    <cfcatch type="any">
        <cflog type="error" text="[Error in x_292_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
