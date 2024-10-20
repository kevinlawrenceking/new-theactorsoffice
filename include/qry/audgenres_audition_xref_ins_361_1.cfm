
<cftry>
    <cfset result = createObject("component", "services.GenreAuditionService").updateaudgenres_audition_xref(
        ID=new_ID,
        audroleid=new_audRoleID,
        audgenreID=new_audgenreID
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audgenres_audition_xref_ins_361_1.cfm] #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
