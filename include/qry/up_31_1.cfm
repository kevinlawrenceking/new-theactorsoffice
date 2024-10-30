
<cftry>
    <cfset userService = new "/services/UserService.cfc"()>
    <cfset userService.UPDtaousers(view=view, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in up_31_1.cfm], Error: #cfcatch.message#">
    </cfcatch>
</cftry>
