
<cftry>
    <cfset contactImportService = createObject("component", "services.ContactImportService")>
    <cfset g = contactImportService.SELcontactsimport_24413(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in g_315_20.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
