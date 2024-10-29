
<cftry>
    <cfset var systemUserService = createObject("component", "/services/SystemUserService")>
    <cfset var k = systemUserService.getNotifications(userid=#userid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in k_195_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
