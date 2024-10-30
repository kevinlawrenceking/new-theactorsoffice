
<cftry>
    <cfset contactImportService = createObject("component", "services.ContactImportService")>
    <cfset i = contactImportService.SELcontactsimport_24417(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in i_315_24.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
