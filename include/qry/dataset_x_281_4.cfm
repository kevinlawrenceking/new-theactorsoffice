
<cftry>
    <cfset dataset_x = createObject("component", "services.ReportItemService").getDistinctItemDatasets(userid=#userid#, reportid=#reports.reportid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in dataset_x_281_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
