
<cftry>
    <cfset find = createObject("component", "/services/AuditionSubmitSiteUserService").getaudsubmitsites_user(userid=userid, submitsitename=new_submitsitename)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_197_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
