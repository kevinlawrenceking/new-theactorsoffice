
<cftry>
    <cfset essenceService = createObject("component", "services.EssenceService")>
    <cfset essenceService.updateEssence(new_essenceName=new_essenceName, isdeleted=isdeleted, essenceid=essenceid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_264_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the essence.">
    </cfcatch>
</cftry>
