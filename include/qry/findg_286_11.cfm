
<cftry>
    <cfset findg = createObject("component", "services.AuditionEssenceXRefService").getaudessences_audtion_xref(
        essencename = essences.essencename,
        audroleid = audroleid,
        userid = userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findg_286_11.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
