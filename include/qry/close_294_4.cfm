
<cftry>
    <cfset systemUserService = new services.SystemUserService()>
    <cfset systemUserService.UPDfusystemusers_24315(suid=suid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in close_294_4.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
