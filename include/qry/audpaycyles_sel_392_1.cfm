
<cftry>
    <cfset audpaycyles_sel = createObject("component", "/services/AuditionPayCycleService").getaudpaycycles()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audpaycyles_sel_392_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
