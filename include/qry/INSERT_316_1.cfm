
<cftry>
    <cfset variables.uploadService = createObject("component", "services.UploadService")>
    <cfset variables.uploadService.insertUpload(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in INSERT_316_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
