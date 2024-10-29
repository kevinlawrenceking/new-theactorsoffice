
<cftry>
    <cfset suid = 123> <!--- Example suid value, replace with actual variable or input --->
    <cfset systemUserService = createObject("component", "/services/SystemUserService")>
    <cfset reldetails = systemUserService.getSystemUserDetails(suid=suid)>
    
    <!--- Additional code outside of the cfquery block remains here --->
    
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in reldetails_271_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>

