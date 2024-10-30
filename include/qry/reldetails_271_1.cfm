
<cftry>
    <cfset systemUserService = createObject("component", "services.SystemUserService")>
    <cfset reldetails = systemUserService.DETfusystemusers(suid=suid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in reldetails_271_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
