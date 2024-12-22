<cfset contactImportService = createObject("component", "services.ContactImportService")>
<cfset x = contactImportService.selContactsImport(uploadId=new_uploadid)>