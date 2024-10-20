
<cftry>
    <cfset export_ac = createObject("component", "/services/ExportItemService").getexportitems(new_exportid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in export_ac_115_15.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
