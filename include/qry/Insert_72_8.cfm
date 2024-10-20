
<cftry>
    <cfset result = createObject("component", "/services/NotificationService").insertnotifications(
        subtitle = "Maintenance system created for #new_contactname#",
        userid = session.userid,
        notifUrl = "/app/contact/?contactid=#contactid#&t4=1",
        notifTitle = "Maintenance System Created!",
        notifType = "System Added",
        contactid = contactid,
        read = 0
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Insert_72_8.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
