 
    <!--- Load the SiteLinkUserService component --->
    <cfset variables.siteLinkUserService = createObject("component", "/services/SiteLinkUserService")>

    <!--- Call INSsitelinks_user and capture the returned ID --->
    <cfset id = variables.siteLinkUserService.INSsitelinks_user(
        new_sitename = new_sitename, 
        new_siteurl = new_siteurl, 
        userid = userid, 
        new_sitetypeid = new_sitetypeid, 
        ver = ver
    )>

    <!--- Log the inserted ID if needed, for debugging --->
    <cflog file="application" text="Inserted ID for new site link: #variables.id#" type="info">
 

 