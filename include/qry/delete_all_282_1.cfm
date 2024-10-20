
<cftry>
    <cfset reportItemService = new "/services/ReportItemService.cfc"()>
    <cfset reportItemService.deletereportitems(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in delete_all_282_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
