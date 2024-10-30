
<cftry>
    <cfset imports = createObject("component", "services.AuditionImportService").SELauditionsimport_24561(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in imports_372_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
