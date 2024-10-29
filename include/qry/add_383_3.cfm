
<cftry>
    <cfset componentPath = "/services/AuditionMediaXRefService.cfc">
    <cfset auditionMediaXRefService = createObject("component", componentPath)>
    <cfset auditionMediaXRefService.insertAuditionMedia(audprojectid=audprojectid, new_mediaID=new_mediaID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_383_3.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
