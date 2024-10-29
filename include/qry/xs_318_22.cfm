
<cftry>
    <cfset xs = createObject("component", "/services/FUActionService").getFuActions()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in xs_318_22.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
