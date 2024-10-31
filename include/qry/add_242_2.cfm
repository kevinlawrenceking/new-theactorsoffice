 
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
 
 

 