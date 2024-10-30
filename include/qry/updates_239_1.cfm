
<cftry>
    <cfset updates = createObject("component", "services.SiteTypeUserService").SELsitetypes_user_24133(new_sitetypeid=new_sitetypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updates_239_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
