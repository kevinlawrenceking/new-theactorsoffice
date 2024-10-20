
<cftry>
    <cfset result = createObject("component", "services.NotificationService").insertnotifications(
        subtitle = "Appointment completed. Follow-Up with #new_contactname#",
        userid = new_userid,
        notifUrl = "/app/contact/?contactid=#new_contactid#&t4=1",
        notifTitle = "Follow-Up System Created!",
        notifType = "System Added",
        contactid = new_contactid,
        read = 0,
        notifdescript = sunotes
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in Insert_157_6.cfm] " & cfcatch.message>
</cfcatch>
</cftry>
