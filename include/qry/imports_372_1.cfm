
<cftry>
    <cfset imports = createObject("component", "/services/AuditionImportService").getUploadsByUser(userid=#userid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in imports_372_1.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
