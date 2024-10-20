
<cftry>
    <cfset userService = new "/services/UserService.cfc"()>
    <cfset U = userService.gettaousers(select_userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in U_73_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
