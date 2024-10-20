
<cftry>
    <cfset insertResult = createObject("component", "services.AuditionEssenceXRefService").insertaudessences_audtion_xref(
        audRoleID = new_audroleid,
        essenceid = new_essenceid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_287_10.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
