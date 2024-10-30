
<cftry>
    <cfset sitetypesService = createObject("component", "services.SiteTypeUserService")>
    <cfset sitetypes = sitetypesService.SELsitetypes_user_24752(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in sitetypes_535_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
