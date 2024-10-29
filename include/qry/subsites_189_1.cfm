
<cftry>
    <cfset subsites = createObject("component", "services.AuditionSubmitSiteUserService").getSubmitSites(userid=userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in subsites_189_1.cfm]: #cfcatch.message#; Data: #userid#" />
        <cfset subsites = QueryNew("submitsiteid, submitsitename, catlist") />
    </cfcatch>
</cftry>
