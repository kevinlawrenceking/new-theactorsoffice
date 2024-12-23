<cfset contactImportService = createObject("component", "services.ContactImportService")>

<cftry>
    <!--- Call the INScontactsimport function --->
    <cfset insertedCount = contactImportService.INScontactsimport(importData=importdata, newUploadId=new_uploadid)>



<cfcatch type="any">
    <!--- Log the error and show debugging information --->
    <cflog file="application" text="Error during insertion: #cfcatch.message#">
    <cfoutput>
        <h3>Error Occurred</h3>
        <p>#cfcatch.message#</p>
    </cfoutput>
    <cfabort>
</cfcatch>
</cftry>


