
<cftry>
    <cfset r = createObject("component", "/services/NotificationService").getfunotifications(
        suStatus="Active",
        notStatus="Pending",
        userid=session.userid,
        notstartdate=DateFormat(Now(), 'yyyy-mm-dd')
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in r_462_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
