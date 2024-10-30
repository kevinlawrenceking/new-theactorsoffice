
<cftry>
    <cfset findid = createObject("component", "services.ReportUserService").SELreports_user_24232(userid=userid, new_reportid=new_reportid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findid_282_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
