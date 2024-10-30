
<cftry>
    <cfset find = createObject("component", "/services/AuditionSubmitSiteUserService").SELaudsubmitsites_user_24034(userid=userid, new_submitsitename=new_submitsitename)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_197_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
