
<cftry>
    <cfset notsInactive = createObject("component", "/services/NotificationStatusService").getnotstatuses(
        currentid = currentid,
        suid = sysActive.suid,
        userid = session.userid,
        currentDate = DateFormat(Now(), 'yyyy-mm-dd')
    )>
    <!--- Additional code outside of the cfquery block remains unchanged --->
<cfcatch type="any">
    <cflog text="[Error in notsInactive_510_2.cfm]: #cfcatch.message#" file="errorLog">
</cfcatch>
</cftry>
