
<cftry>
    <cfset find_subsite = createObject("component", "services.AuditionSubmitSiteUserService").SELaudsubmitsites_user_24295(userid=userid, new_submitsitename=trim(new_submitsitename))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_subsite_287_21.cfm]: #cfcatch.message#">
        <cfset find_subsite = queryNew("new_submitsiteid,new_catlist", "integer,varchar")>
    </cfcatch>
</cftry>
