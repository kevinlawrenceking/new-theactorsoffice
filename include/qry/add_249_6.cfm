
<cftry>
    <cfset result = new services.SiteTypeUserService().updatesitetypes_user(new_pnid, new_sitetypeid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in add_249_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
