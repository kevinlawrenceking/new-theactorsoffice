
<cftry>
    <cfset values_x = createObject("component", "services.ReportItemService").SELreportitems_24227(
        userid = userid,
        reportid = reports.reportid,
        itemdataset = dataset_x.itemdataset
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in values_x_281_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
