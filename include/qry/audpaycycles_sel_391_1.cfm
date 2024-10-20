
<cftry>
    <cfset audpaycycles_sel = createObject("component", "services.AuditionPayCycleService").getaudpaycycles()>
<cfcatch type="any">
    <cfset errorLog = "[Error in audpaycycles_sel_391_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
