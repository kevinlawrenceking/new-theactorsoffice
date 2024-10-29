
<cftry>
    <cfset importService = new "/services/AuditionImportService.cfc"()>
    <cfset importService.INSauditionsimport_24392(importdata=importdata, new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_317_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
