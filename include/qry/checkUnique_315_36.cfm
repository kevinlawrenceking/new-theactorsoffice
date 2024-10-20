
<cftry>
    <cfset checkUnique = createObject("component", "/services/NotificationService").getfunotifications({
        contactID: maint_contactid,
        actionTitle: addDaysNo.actionTitle,
        isUnique: adddaysNo.IsUnique
    })>
<cfcatch>
    <cfset errorLog = "[Error in checkUnique_315_36.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
