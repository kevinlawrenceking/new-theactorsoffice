
<cftry>
    <cfset find = createObject("component", "services.AuditionMediaXRefService").getAuditionsByMediaAndProject(new_mediaID=new_mediaID, audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_383_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching auditions." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
