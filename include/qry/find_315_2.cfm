
<cftry>
    <cfset importService = createObject("component", "services.ContactImportService")>
    <cfset importService.insertContactImport(importData=importdata, newUploadId=new_uploadid)>
    <cfquery name="updateFetchStatus" datasource="#yourDatasource#">
        UPDATE yourTableName SET isfetch = 1 WHERE yourCondition
    </cfquery>
<cfcatch type="any">
    <cfset errorLog("[Error in find_315_2.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
