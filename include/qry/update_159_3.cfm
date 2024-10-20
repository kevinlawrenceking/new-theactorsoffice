
<cftry>
    <cfset userService = new "/services/UserService.cfc"()>
    <cfset userService.updatetaousers(
        new_userfirstname = new_userfirstname,
        new_userlastname = new_userlastname,
        new_avatarname = new_avatarname,
        new_useremail = new_useremail,
        userid = userid
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in update_159_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
