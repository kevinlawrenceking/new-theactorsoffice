
<cftry>
    <cfset sitetypes = createObject("component", "services.SiteTypeUserService").getSiteTypesByUserId(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in sitetypes_535_1.cfm]: #cfcatch.message#">
        <cfset sitetypes = queryNew("sitetypeid,sitetypename,sitetypedescription,pntitle")>
    </cfcatch>
</cftry>
