
<cftry>
    <cfset result = createObject("component", "/services/AuditionSubmitSiteUserService").insertaudsubmitsites_user(
        submitsiteName = trim(new_submitsitename),
        userid = userid,
        catlist = new_catid
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming there's a function or query to update the database with isfetch value --->
<cfcatch type="any">
    <cfset errorLog = "[Error in add_287_23.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
