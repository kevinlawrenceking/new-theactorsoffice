
<cftry>
    <cfset essenceService = new services.EssenceService()>
    <cfset essenceService.INSessences(new_essenceName=new_essenceName, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_sitetype_205_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting essence." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
