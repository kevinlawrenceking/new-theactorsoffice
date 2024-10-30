
<cftry>
    <cfset variables.reportItemService = createObject("component", "services.ReportItemService")>
    <cfset variables.reportItemService.INSreportitems(
        itemLabel = new_label_new,
        itemOrderNo = i,
        itemValueInt = new_itemValueInt,
        ID = new_id,
        itemDataset = new_itemDataSet
    )>
    <cfquery datasource="abod">
        UPDATE reportitems SET isfetch = 1 WHERE some_condition_here
    </cfquery>
    <cfcatch>
        <cflog file="errorLog" text="[Error in Insert_ReportItems_146_2.cfm]: #cfcatch.message# - Detail: #cfcatch.detail#" type="error">
    </cfcatch>
</cftry>
