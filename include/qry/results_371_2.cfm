
<cftry>
    <cfset results = createObject("component", "services.AuditionProjectService").getaudprojects(
        userid = userid,
        byimport = byimport,
        sel_contactid = sel_contactid,
        colist = colist,
        sel_audcatid = sel_audcatid,
        sel_audstepid = sel_audstepid,
        sel_audtype = sel_audtype,
        auddate = auddate,
        cur_date = cur_date,
        materials = materials,
        audsearch = audsearch
    )>
    <cfcatch type="any">
        <cfset errorLog("[Error in results_371_2.cfm]: " & cfcatch.message)>
    </cfcatch>
</cftry>
