
<cftry>
    <cfset essenceService = createObject("component", "services.EssenceService")>
    <cfset essenceService.UPDessences(new_essenceid=new_essenceid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in delete_102_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the essence." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
