
<cftry>
    <cfset findg = createObject("component", "services.AuditionEssenceXRefService").SELaudessences_audtion_xref(
        essencename = essences.essencename,
        audroleid = audroleid,
        userid = userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in findg_286_11.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
