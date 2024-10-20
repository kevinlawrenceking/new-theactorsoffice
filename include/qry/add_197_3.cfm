
<cftry>
    <cfset result = new services.AuditionSubmitSiteUserService().insertaudsubmitsites_user(
        submitsitename = new_submitsitename, 
        catlist = sortedCatList, 
        userid = userid
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming there is a mechanism to update the database status here --->
<cfcatch type="any">
    <cfset errorLog = "[Error in add_197_3.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
