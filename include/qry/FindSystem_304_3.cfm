
<cftry>
    <cfset FindSystem = createObject("component", "services.SystemService").getfusystems(new_systemtype, new_systemscope)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindSystem_304_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
