
<cftry>
    <cfset reportUserService = createObject("component", "services.ReportUserService")>
    <cfset ratio_17 = reportUserService.getItemValueInt(userId=session.userid, reportId=17)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in ratio_17_524_13.cfm]: #cfcatch.message#">
        <cfset ratio_17 = queryNew("item_17")>
    </cfcatch>
</cftry>
