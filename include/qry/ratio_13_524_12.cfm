
<!--- This ColdFusion page retrieves the item value for a specific report associated with the current user. --->
<cftry>
    <cfset reportUserService = createObject("component", "services.ReportUserService")>
    <cfset ratio_13 = reportUserService.SELreports_user_24736(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in ratio_13_524_12.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
