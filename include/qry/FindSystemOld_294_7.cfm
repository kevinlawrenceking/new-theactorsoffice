
<cftry>
    <cfset FindSystemOld = createObject("component", "services.SystemService").SELfusystems_24318(systemType=old_systemtype, systemScope=old_systemscope)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindSystemOld_294_7.cfm]: #cfcatch.message#">
        <cfset FindSystemOld = queryNew("")>
    </cfcatch>
</cftry>
