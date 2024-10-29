
<cftry>
    <cfset find = createObject("component", "services.AuditionSubmitSiteUserService").getSubmitSiteId(userid=userid, new_submitsitename=new_submitsitename)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_197_1.cfm]: #cfcatch.message#">
        <cfset find = queryNew("submitsiteid", "integer")>
    </cfcatch>
</cftry>
