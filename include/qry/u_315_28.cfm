
<cftry>
    <cfset contactImportService = createObject("component", "services.ContactImportService")>
    <cfset u = contactImportService.SELcontactsimport_24421(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in u_315_28.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
