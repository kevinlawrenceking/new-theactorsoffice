
<cftry>
    <cfset variables.contactImportService = createObject("component", "services.ContactImportService")>
    <cfset variables.contactImportService.INScontactsimport(importData=importdata, newUploadId=new_uploadid)>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <cfquery name="updateFetchStatus" datasource="#yourDatasource#">
        UPDATE yourTableName SET isfetch = 1 WHERE yourCondition
    </cfquery>
<cfcatch type="any">
    <cfset errorLog = "[Error in find_315_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
