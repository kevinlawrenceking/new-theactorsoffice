
<cftry>
    <cfset details = createObject("component", "services.AuditionSubmitSiteUserService").DETaudsubmitsites_user(submitsiteid=submitsiteid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_259_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
