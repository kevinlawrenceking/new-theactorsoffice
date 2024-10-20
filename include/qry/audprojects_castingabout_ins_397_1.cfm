
<cftry>
    <cfset result = createObject("component", "/services/AuditionProjectsCastingAboutService").insertaudprojects_castingabout(
        projName = new_projName,
        projtye = new_projtye,
        Status1 = new_Status1,
        Status2 = new_Status2,
        CastingAgency = new_CastingAgency,
        CastingDir = new_CastingDir,
        CastingAssociate = new_CastingAssociate,
        CastingAssistant = new_CastingAssistant,
        Notes1 = new_Notes1,
        Notes2 = new_Notes2,
        Notes3 = new_Notes3,
        CastingDir2 = new_CastingDir2,
        audnetwork = new_audnetwork
    )>
<cfcatch type="any">
    <cfset errorLog("[Error in audprojects_castingabout_ins_397_1.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
