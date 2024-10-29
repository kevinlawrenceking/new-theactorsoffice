
<cftry>
    <cfset exportService = new "/services/ExportService.cfc"()>
    <cfset exportService.insertExport(userid=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in AddExport_115_1.cfm]: #cfcatch.message#"/>
        <cfthrow message="Error occurred while adding export." detail="#cfcatch.detail#"/>
    </cfcatch>
</cftry>
