
<cftry>
    <cfset find_subsite = createObject("component", "/services/AuditionSubmitSiteUserService").getaudsubmitsites_user(userid=userid, submitsitename=trim(new_submitsitename))>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_subsite_287_21.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
