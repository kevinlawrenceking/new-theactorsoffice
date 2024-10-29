
<cftry>
    <cfset x = createObject("component", "/services/NotificationService").getDuplicateNotifications()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_283_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
