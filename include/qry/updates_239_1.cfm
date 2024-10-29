
<cftry>
    <cfset updates = createObject("component", "services.SiteTypeUserService").getSiteTypeDetails(new_sitetypeid=new_sitetypeid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updates_239_1.cfm]: #cfcatch.message# Query: #cfcatch.detail#" />
    </cfcatch>
</cftry>
