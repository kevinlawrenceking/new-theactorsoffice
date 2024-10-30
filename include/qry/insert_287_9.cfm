
<cftry>
    <cfset essenceService = createObject("component", "services.EssenceService")>
    <cfset essenceService.INSessences_24283(new_essence=new_essence, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_287_9.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while calling the function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
