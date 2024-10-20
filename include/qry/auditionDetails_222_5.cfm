
<cftry>
    <cfset auditionDetails = createObject("component", "/services/AuditionProjectService").getaudprojects(new_eventid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in auditionDetails_222_5.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
