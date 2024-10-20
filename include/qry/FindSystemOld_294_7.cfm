
<cftry>
    <cfset FindSystemOld = createObject("component", "services.SystemService").getfusystems(old_systemtype, old_systemscope)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindSystemOld_294_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
