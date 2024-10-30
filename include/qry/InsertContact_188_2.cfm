
<cftry>
    <cfset userService = new services.UserService()>
    <cfset userService.UPDtaousers_23999(userFirstName=FindUser.userfirstname, userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in InsertContact_188_2.cfm]: #cfcatch.message#">
        <cfthrow message="Error updating user avatar." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
