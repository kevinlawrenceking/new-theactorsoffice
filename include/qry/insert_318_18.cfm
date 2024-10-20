
<cftry>
    <cfset SiteLinkUserService = new "/services/SiteLinkUserService.cfc"()>
    <cfset SiteLinkUserService.insertsitelinks_user(
        siteName = x.sitename,
        siteURL = x.siteurl,
        siteicon = x.siteicon,
        siteTypeid = new_sitetypeid,
        userid = users.userid
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
<cfcatch type="any">
    <cfset errorLog = "[Error in insert_318_18.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
