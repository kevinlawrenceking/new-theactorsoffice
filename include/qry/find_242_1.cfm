

<cftry>
    <!--- Create an instance of the SiteLinkUserService component --->
    <cfset variables.siteLinkUserService = createObject("component", "services.SiteLinkUserService")>

    <!--- Call the INSsitelinks_user method with the required parameters --->
    <cfset variables.siteLinkUserService.INSsitelinks_user(
        new_sitename = new_sitename, 
        new_siteurl = new_siteurl, 
        userid = userid, 
        new_sitetypeid = new_sitetypeid, 
        ver = ver
    )>
<cfcatch>
    <!--- Log and throw any errors encountered --->
    <cflog file="errorLog" text="[Error in add_242_2.cfm]: #cfcatch.message#">
    <cfthrow message="Error occurred while adding site link." detail="#cfcatch.detail#">
</cfcatch>
</cftry>