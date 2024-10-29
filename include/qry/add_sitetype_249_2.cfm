
<cftry>
    <cfset variables.siteTypeService = new "/services/SiteTypeUserService.cfc"()>
    <cfset variables.siteTypeService.insertSiteType(new_siteTypeName=new_siteTypeName, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_sitetype_249_2.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling insertSiteType function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
