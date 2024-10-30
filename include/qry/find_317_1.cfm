
<cftry>
    <cfset componentPath = "/services/AuditionImportService.cfc">
    <cfset auditionImportService = createObject("component", componentPath)>
    <cfset auditionImportService.INSauditionsimport_24392(importdata=importdata, new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_317_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
