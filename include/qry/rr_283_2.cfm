
<cftry>
    <cfset rr = createObject("component", "/services/NotificationService").updatefunotifications(x.new_notid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in rr_283_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
