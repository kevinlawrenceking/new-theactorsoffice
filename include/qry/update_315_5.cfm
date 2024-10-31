
<cftry>
    <cfset variables.contactImportService = createObject("component", "services.ContactImportService")>
    <cfset variables.contactImportService.UPDCONTACTSIMPORT(new_status=new_status, new_contactid=new_contactid, id=x.id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_315_5.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
