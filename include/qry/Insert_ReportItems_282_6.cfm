
<cftry>
    <cfset variables.reportItemService = createObject("component", "services.ReportItemService")>
    <cfset variables.reportItemService.INSreportitems_24233(
        newLabel = report_4_loop.new_label,
        itemOrderNo = i,
        newID = new_id,
        newItemDataSet = report_4_loop.new_itemDataSet,
        userID = int(userid)
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in Insert_ReportItems_282_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
