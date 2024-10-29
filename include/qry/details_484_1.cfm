
<cftry>
    <cfset details = createObject("component", "services.UploadService").getUploadDetails(uploadid=uploadid) />
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in details_484_1.cfm]: #cfcatch.message#"/>
    </cfcatch>
</cftry>
