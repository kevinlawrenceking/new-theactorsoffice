
<cftry>
    <cfset result = createObject("component", "services.AuditionEssenceXRefService").deleteaudessences_audtion_xref(audRoleID=new_audroleid, essenceid=desired_essenceid)>

    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_287_2.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
