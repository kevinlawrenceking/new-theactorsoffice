
<cftry>
    <cfset reportItemService = new services.ReportItemService()>
    <cfset reportItemService.insertReportItems(
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
