
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset userService.UPDtaousers(view=view, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in up_31_1.cfm], Error: #cfcatch.message#">
    </cfcatch>
</cftry>
