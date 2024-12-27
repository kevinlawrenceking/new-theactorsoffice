<cfset ContactImportService = createObject("component", "services.ContactImportService") />
<cfset tag = ContactImportService.getcontactsImportTag(uploadid=new_uploadid,tag_label="tag2") />