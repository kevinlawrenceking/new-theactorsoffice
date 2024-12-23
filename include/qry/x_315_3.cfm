<cfset contactImportService = createObject("component", "services.ContactImportService")>
<cfset new = contactImportService.selContactsImport(uploadId=new_uploadid)>