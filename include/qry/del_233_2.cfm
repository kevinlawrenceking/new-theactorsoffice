
<cftry>
    <cfset componentPath = "/services/NotificationService">
    <cfset functionName = "updatefunotifications">
    
    <cfset createObject("component", componentPath).#functionName#()>

    <cfcatch type="any">
        <cfset errorLog = "[Error in del_233_2.cfm]: " & cfcatch.message>
        <cflog text="#errorLog#" type="error">
    </cfcatch>
</cftry>
