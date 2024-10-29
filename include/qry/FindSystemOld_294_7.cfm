
<cftry>
    <cfset FindSystemOld = createObject("component", "services.SystemService").getSystemDetails(systemType=old_systemtype, systemScope=old_systemscope)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindSystemOld_294_7.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
