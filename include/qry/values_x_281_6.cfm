
<cftry>
    <cfset values_x = createObject("component", "/services/ReportItemService").getreportitems(
        userid = userid,
        reportid = reports.reportid,
        itemDataset = dataset_x.itemdataset
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in values_x_281_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
