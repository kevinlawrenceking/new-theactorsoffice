
<cftry>
    <cfset componentPath = "/services/EventContactsXRefService.cfc">
    <cfset functionName = "deleteeventcontactsxref">

    <cfset result = createObject("component", componentPath).functionName()>

    <cfcatch type="any">
        <cfset errorLog = "[Error in remove_191_11.cfm]: " & cfcatch.message>
        <cflog file="errorLog" text="#errorLog#">
    </cfcatch>
</cftry>
