
<cftry>
    <cfset contactImportService = createObject("component", "/services/ContactImportService")>
    <cfset f = contactImportService.SELcontactsimport_24411(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in f_315_18.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
