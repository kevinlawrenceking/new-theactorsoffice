
<cftry>
    <cfset siteLinkUserService = createObject("component", "services.SiteLinkUserService")>
    <cfset find = siteLinkUserService.SELsitelinks_user_24138(userid=userid, new_sitename=new_sitename)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_242_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
