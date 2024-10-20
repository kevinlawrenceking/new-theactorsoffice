
<cftry>
    <cfset result = createObject("component", "services.ExportService").insertexports(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in AddExport_115_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
