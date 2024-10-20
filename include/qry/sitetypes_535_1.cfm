
<cftry>
    <cfset sitetypes = createObject("component", "services.SiteTypeUserService").getsitetypes_user(userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in sitetypes_535_1.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
