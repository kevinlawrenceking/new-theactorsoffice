
<cftry>
    <cfset userService = createObject("component", "services.UserService")>
    <cfset U = userService.SELtaousers_23842(select_userid=select_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in U_73_1.cfm]: #cfcatch.message#">
        <cfset U = queryNew("userid,recordname,userFirstName,userLastName,userEmail,contactid,userRole")>
    </cfcatch>
</cftry>
