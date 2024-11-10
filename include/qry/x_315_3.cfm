<cfset contactImportService = createObject("component", "services.ContactImportService")>
<cfset x = contactImportService.SELcontactsimport(uploadId=new_uploadid)>