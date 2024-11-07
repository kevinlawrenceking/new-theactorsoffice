 
    <!--- Load the SiteLinkUserService component --->
    <cfset siteLinkUserService = createObject("component", "services.SiteLinkUserService")>

    <!--- Call INSsitelinks_user and capture the returned ID --->
    <cfset id = siteLinkUserService.INSsitelinks_user(
        new_sitename = new_sitename, 
        new_siteurl = new_siteurl, 
        userid = userid, 
        new_sitetypeid = new_sitetypeid, 
        ver = ver
    )>
 
 

 