
<cftry>
    <cfset actionUserService = createObject("component", "services.ActionUserService")>
    <cfset actionUserService.insertActionUser(
        actionid = xs.actionid,
        userid = u.userid,
        actiondaysno = xs.actiondaysno,
        actiondaysrecurring = xs.actiondaysrecurring
    )>
    <cfquery datasource="abod">
        UPDATE your_table_name SET isfetch = 1 WHERE your_condition
    </cfquery>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_283_7.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
