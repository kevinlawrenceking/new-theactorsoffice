
<cftry>
    <cfset actionUserService = new services.ActionUserService()>
    <cfset actionUserService.INSactionusers(
        actionid = xs.actionid,
        userid = u.userid,
        actiondaysno = xs.actiondaysno,
        actiondaysrecurring = xs.actiondaysrecurring
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_283_7.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
