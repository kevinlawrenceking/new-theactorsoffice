<!--- Include the CFC file and create an instance of the component --->
<cfset contactsImportService = createObject("component", "services.ContactsImportService")>

<!--- Call the getImportsByUserID function and store the result in the imports query --->
<cfset imports = contactsImportService.getImportsByUserID(userid=userid)>

 