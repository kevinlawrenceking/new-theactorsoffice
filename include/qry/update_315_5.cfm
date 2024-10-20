
<cftry>
    <cfset contactImportService = new "/services/ContactImportService.cfc"()>
    <cfset result = contactImportService.updateCONTACTSIMPORT(new_status=new_status, new_contactid=new_contactid, id=x.id)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_315_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
