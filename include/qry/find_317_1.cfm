<cfset componentPath = "/services/AuditionImportService.cfc">
<cfset auditionImportService = createObject("component", componentPath)>
<cfset auditionImportService.INSauditionsimport_24392(importdata=importdata, new_uploadid=new_uploadid)>