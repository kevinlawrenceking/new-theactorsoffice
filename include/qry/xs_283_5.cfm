
<cftry>
    <cfset xs = createObject("component", "/services/FUActionService").getFuActions(target_id_system=target_id_system)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in xs_283_5.cfm]: #cfcatch.message#">
        <cfset xs = queryNew("actionid,actiondaysno,actiondaysrecurring")>
    </cfcatch>
</cftry>
