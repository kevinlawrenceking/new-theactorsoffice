
<cftry>
    <cfset actionUserService = new "/services/ActionUserService.cfc" />
    <cfset result = actionUserService.insertactionusers(
        actionid = xs.actionid,
        userid = users.userid,
        actiondaysno = xs.actiondaysno,
        actiondaysrecurring = xs.actiondaysrecurring
    ) />
<cfcatch>
    <cfset errorLog = "[Error in insert_318_24.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
