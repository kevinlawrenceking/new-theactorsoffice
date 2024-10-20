
<cftry>
    <cfset result = createObject("component", "services.GenreAuditionService").insertaudgenres_audition_xref(
        audroleid = new_audRoleID,
        audgenreID = new_audgenreID
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in audgenres_audition_xref_ins_360_1.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
