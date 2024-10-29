
<cftry>
    <cfset export_ac = createObject("component", "services.ExportItemService").getExportItems(exportID=new_exportid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in export_ac_115_15.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching export items." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
