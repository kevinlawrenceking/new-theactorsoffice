
<cftry>
    <cfset reportItemService = new "/services/ReportItemService.cfc"()>
    <cfset reportItemService.deleteReportItems(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_all_282_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
