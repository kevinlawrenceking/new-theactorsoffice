
<cftry>
    <cfset contactImportService = createObject("component", "services.ContactImportService")>
    <cfset h = contactImportService.SELcontactsimport_24415(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in h_315_22.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
