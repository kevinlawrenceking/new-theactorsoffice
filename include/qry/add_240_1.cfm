
<cftry>
    <cfset result = createObject("component", "services.SiteTypeUserService").updatesitetypes_user(new_sitetypename=new_sitetypename, new_sitetypeid=new_sitetypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_240_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
