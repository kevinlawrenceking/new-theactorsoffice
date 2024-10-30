
<cftry>
    <cfset variables.siteTypeUserService = createObject("component", "services.SiteTypeUserService")>
    <cfset variables.siteTypeUserService.INSsitetypes_user(new_siteTypeName=new_siteTypeName, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_sitetype_249_2.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INSsitetypes_user function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
