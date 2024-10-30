
<cftry>
    <cfset checkUnique = createObject("component", "services.NotificationService").SELfunotifications_24429(
        maint_contactid = maint_contactid,
        actionTitle = addDaysNo.actionTitle,
        isUnique = adddaysNo.IsUnique
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in checkUnique_315_36.cfm]: #cfcatch.message#">
        <cfset checkUnique = queryNew("actionID")>
    </cfcatch>
</cftry>
