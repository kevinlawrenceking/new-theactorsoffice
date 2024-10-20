
<cftry>
    <cfset audmedia_picklist = createObject("component", "services.AuditionMediaService").getaudmedia(userid=userid, audprojectid=audprojectid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in audmedia_picklist_385_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
