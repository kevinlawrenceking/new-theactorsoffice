
<cftry>
    <cfset actionUserService = new "/services/ActionUserService.cfc"()>
    <cfset actionUserService.insertactionusers(
        actionid = xs.actionid,
        userid = u.userid,
        actiondaysno = xs.actiondaysno,
        actiondaysrecurring = xs.actiondaysrecurring
    )>
<cfcatch type="any">
    <cfset errorLog = "[Error in insert_283_7.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
