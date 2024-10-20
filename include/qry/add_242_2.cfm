
<cftry>
    <cfset queryResult = createObject("component", "services.SiteLinkUserService").insertsitelinks_user(
        sitename=new_sitename, 
        siteurl=new_siteurl, 
        userid=userid, 
        sitetypeid=new_sitetypeid, 
        IsCustom=1,
        ver=ver
    )>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming you have a function or query to update this --->
    <!--- Example: updateDatabaseIsFetchStatus() --->
<cfcatch type="any">
    <cfset errorLog = "[Error in add_242_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
