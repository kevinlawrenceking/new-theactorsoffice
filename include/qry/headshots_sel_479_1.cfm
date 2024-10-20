
<cftry>
    <cfset headshots_sel = createObject("component", "services.AuditionMediaService").getaudmedia(userid=variables.userid, audprojectid=variables.audprojectid)>
<cfcatch>
    <cfset errorLog("[Error in headshots_sel_479_1.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
