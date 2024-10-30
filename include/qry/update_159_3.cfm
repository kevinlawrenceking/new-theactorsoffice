
<cftry>
    <cfset userService = new services.UserService()>
    <cfset userService.UPDtaousers_23945(
        new_userfirstname = new_userfirstname,
        new_userlastname = new_userlastname,
        new_avatarname = new_avatarname,
        new_useremail = new_useremail,
        userid = userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in update_159_3.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while updating the user. Please try again later.">
    </cfcatch>
</cftry>
