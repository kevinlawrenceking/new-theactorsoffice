<cfset contactImportService = createObject("component", "services.ContactImportService")>
<cfset contactImportService.INScontactsimport(importData=importdata, newUploadId=new_uploadid)>

