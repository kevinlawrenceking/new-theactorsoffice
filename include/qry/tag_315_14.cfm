<cfset contactImportService = createObject("component", "services.contactImportService")>
<cfset tag = contactImportService.getcontactsImportTag(uploadid=new_uploadid,tag_label="tag3")>