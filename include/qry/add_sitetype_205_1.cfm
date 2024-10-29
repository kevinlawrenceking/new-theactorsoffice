
<cftry>
    <cfset essenceService = createObject("component", "/services/EssenceService")>
    <cfset essenceService.insertEssence(new_essenceName=new_essenceName, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_sitetype_205_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while adding site type." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
