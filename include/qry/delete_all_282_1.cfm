
<cftry>
    <cfset variables.reportItemService = createObject("component", "/services/ReportItemService")>
    <cfset variables.reportItemService.DELreportitems(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_all_282_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
