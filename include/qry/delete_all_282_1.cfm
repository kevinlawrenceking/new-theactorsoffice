
<cftry>
    <cfset variables.reportItemService = new "/services/ReportItemService.cfc"()>
    <cfset variables.reportItemService.DELreportitems(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_all_282_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
