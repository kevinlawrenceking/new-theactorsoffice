<cfset actionUserService = createObject("component", "services.ActionUserService")>
<cfset actionUserService.INSactionusers(
    actionid = xs.actionid,
    userid = u.userid,
    actiondaysno = xs.actiondaysno,
    actiondaysrecurring = xs.actiondaysrecurring
)>