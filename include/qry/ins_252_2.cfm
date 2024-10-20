
<cftry>
    <cfset componentPath = "/services/AuditionMediaXRefService.cfc">
    <cfset auditionMediaXRefService = createObject("component", componentPath)>
    <cfset auditionMediaXRefService.insertaudmedia_auditions_xref(mediaid=mediaid, audprojectid=audprojectid)>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming there's a function or query to update the database here --->
<cfcatch type="any">
    <cfset errorLog = "[Error in ins_252_2.cfm] " & cfcatch.message>
</cfcatch>
</cftry>
