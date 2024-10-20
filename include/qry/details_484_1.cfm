
<cftry>
    <cfset uploadService = new "/services/UploadService.cfc"()>
    <cfset details = uploadService.getuploads(uploadid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in details_484_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
