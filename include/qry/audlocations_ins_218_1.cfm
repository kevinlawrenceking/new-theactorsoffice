
<cftry>
    <cfset componentPath = "/services/AuditionLocationService.cfc">
    <cfset auditionLocationService = createObject("component", componentPath)>
    <cfset auditionLocationService.insertAudLocation(userid=userid, custom=custom)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audlocations_ins_218_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the location." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
