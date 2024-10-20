
<cftry>
    <cfset result = new "/services/EssenceService.cfc"().insertessences(new_essenceName, userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_sitetype_205_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
