
<cftry>
    <cfset actionUserService = createObject("component", "services.ActionUserService")>
    <cfset actionUserService.INSactionusers_24455(
        actionid = xs.actionid,
        userid = users.userid,
        actiondaysno = xs.actiondaysno,
        actiondaysrecurring = xs.actiondaysrecurring
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_318_24.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
