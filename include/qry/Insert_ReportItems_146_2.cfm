
<cftry>
    <cfset variables.reportItemService = createObject("component", "services.ReportItemService")>
    <cfset variables.reportItemService.insertReportItem(
        itemLabel = new_label_new,
        itemOrderNo = i,
        itemValueInt = new_itemValueInt,
        ID = new_id,
        itemDataset = new_itemDataSet
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in Insert_ReportItems_146_2.cfm]: #cfcatch.message#" type="error">
        <cfthrow message="Error inserting report item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
