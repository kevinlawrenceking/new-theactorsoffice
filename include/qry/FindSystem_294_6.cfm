
<cftry>
    <cfset FindSystem = createObject("component", "services.SystemService").getfusystems(new_systemtype, new_systemscope)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindSystem_294_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
