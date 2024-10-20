
<cftry>
    <cfset result = createObject("component", "services.UploadService").insertuploads(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in INSERT_316_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
