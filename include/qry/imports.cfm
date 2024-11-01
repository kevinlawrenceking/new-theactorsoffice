<!--- Include the CFC file and create an instance of the component --->
<cfset contactImportService = createObject("component", "services.ContactImportService")>

<!--- Call the getImportsByUserID function and store the result in the imports query --->
<cfset imports = contactImportService.getImportsByUserID(userid=userid)>

 