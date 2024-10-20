
<cftry>
    <cfset reportItemService = new "/services/ReportItemService.cfc" />
    <cfset result = reportItemService.insertreportitems(
        new_label_new = new_label_new,
        i = i,
        new_itemValueInt = new_itemValueInt,
        new_id = new_id,
        new_itemDataSet = new_itemDataSet,
        userid = session.userid
    ) />
    <cfset isfetch = 1 />
<cfcatch type="any">
    <cfset errorLog = "[Error in Insert_ReportItems_146_2.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
