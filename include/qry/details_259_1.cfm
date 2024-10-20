
<cftry>
    <cfset details = createObject("component", "services.AuditionSubmitSiteUserService").getaudsubmitsites_user(submitsiteid=submitsiteid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_259_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
