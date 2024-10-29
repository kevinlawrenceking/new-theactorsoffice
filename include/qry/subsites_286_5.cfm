
<cftry>
    <cfset subsites = createObject("component", "services.AuditionSubmitSiteUserService").getSubmitSites(userid=userid, new_audcatid=new_audcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in subsites_286_5.cfm] #cfcatch.message#">
        <cfset subsites = queryNew("submitsiteid,submitsitename", "integer,varchar")>
    </cfcatch>
</cftry>
