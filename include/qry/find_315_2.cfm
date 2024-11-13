<cfset contactImportService = createObject("component", "services.ContactImportService")>
<cfset contactImportService.INScontactsimport(importData=importdata, newUploadId=new_uploadid)>
<cfset isfetch = 1>
<!--- Update the database to set isfetch = 1 --->
<cfquery result="result"  name="updateFetchStatus" datasource="#abod#">
    UPDATE yourTableName SET isfetch = 1 WHERE yourCondition
</cfquery>