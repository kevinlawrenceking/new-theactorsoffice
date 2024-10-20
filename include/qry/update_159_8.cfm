
<cftry>
    <cfset userService = new "/services/UserService.cfc"()>
    <cfset userService.updatetaousers(userid=userid, new_nletter_link=new_nletter_link, new_nletter_yn=new_nletter_yn)>
    <cfset isfetch = 1>
    <!--- Additional code to update the database with isfetch = 1 can be added here --->
<cfcatch type="any">
    <cfset errorLog = "[Error in update_159_8.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
