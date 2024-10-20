
<cftry>
    <cfset result = createObject("component", "/services/ReportItemService").insertreportitems(
        itemLabel = report_4_loop.new_label,
        itemOrderNo = i,
        itemValueInt = 0,
        ID = new_id,
        itemDataset = report_4_loop.new_itemDataSet,
        userid = int(userid)
    )>
    <cfquery>
        UPDATE database_table SET isfetch = 1 WHERE condition
    </cfquery>
<cfcatch type="any">
    <cfset errorLog = "[Error in Insert_ReportItems_282_6.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
