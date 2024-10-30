
<cftry>
    <cfset createObject("component", "services.UploadService").INSuploads(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in INSERT_316_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
