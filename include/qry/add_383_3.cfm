
<!--- This ColdFusion page handles the insertion of audition media references into the database. --->
<cftry>
    <cfset componentPath = "/services/AuditionMediaXRefService.cfc">
    <cfset componentInstance = createObject("component", componentPath)>
    <cfset componentInstance.INSaudmedia_auditions_xref_24568(audprojectid=audprojectid, new_mediaID=new_mediaID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_383_3.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
