
<cftry>
    <cfset find = createObject("component", "services.SiteTypeUserService").getSiteTypesUser(userid=userid, new_sitetypename=new_sitetypename)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_249_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching site types for user." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
