<cfset contactImportService = createObject("component", "services.ContactImportService")>

<cftry>
    <!--- Call the INScontactsimport function --->
    <cfset insertedCount = contactImportService.INScontactsimport(importData=importdata, newUploadId=new_uploadid)>

    <!--- Debugging: Output what has been inserted --->
    <cfoutput>
        <h3>Debugging Insert Process</h3>
        <p><strong>Upload ID:</strong> #new_uploadid#</p>
        <p><strong>Rows Processed:</strong> #insertedCount#</p>
        <p><strong>Data:</strong></p>
        <table border="1" cellpadding="5">
            <tr>
                <th>Row</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Business Email</th>
                <th>Mobile Phone</th>
                <!--- Add more fields as needed --->
            </tr>
            <cfloop query="importdata">
                <tr>
                    <td>#currentrow#</td>
                    <td>#importdata.FirstName#</td>
                    <td>#importdata.LastName#</td>
                    <td>#importdata.BusinessEmail#</td>
                    <td>#importdata.MobilePhone#</td>
                </tr>
            </cfloop>
        </table>
    </cfoutput>

    <!--- Stop execution after debugging --->
    <cfabort>

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


