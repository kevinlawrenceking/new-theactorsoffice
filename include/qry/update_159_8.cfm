
<cftry>
    <cfset userService = new services.UserService()>
    <cfset userService.UPDtaousers_23950(
        new_nletter_link = new_nletter_link,
        new_nletter_yn = new_nletter_yn,
        userid = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_159_8.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
