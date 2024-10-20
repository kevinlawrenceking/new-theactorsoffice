
<cftry>
    <cfset find = createObject("component", "services.AuditionMediaXRefService").getaudmedia_auditions_xref(
        mediaID=new_mediaID,
        audprojectID=audprojectid
    ) />
<cfcatch>
    <cfset errorLog = "[Error in find_383_2.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
