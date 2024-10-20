
<cftry>
    <cfset findit = createObject("component", "services.SiteTypeUserService").getsitetypes_user(new_sitetypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findit_249_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
