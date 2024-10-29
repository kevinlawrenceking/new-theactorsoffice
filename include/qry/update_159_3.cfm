
<cftry>
    <cfset userService = new services.UserService()>
    <cfset userService.updateUser(
        new_userfirstname = new_userfirstname,
        new_userlastname = new_userlastname,
        new_avatarname = new_avatarname,
        new_useremail = new_useremail,
        userid = userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in update_159_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
