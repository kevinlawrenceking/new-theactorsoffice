<cfset contactImportService = createObject("component", "services.ContactImportService")>
<cfset upload_details = contactImportService.DETcontactsimport(uploadid=uploadid)>