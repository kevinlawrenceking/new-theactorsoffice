
<cftry>
    <cfset reportItemService = new "/services/ReportItemService.cfc"()>
    <cfset result = reportItemService.updatereportitems(new_itemvalueint, new_itemid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_282_8.cfm]: " & cfcatch.message>
        <!--- Handle the error logging as needed --->
    </cfcatch>
</cftry>
