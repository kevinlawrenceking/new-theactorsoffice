
<cftry>
    <cfset result = createObject("component", "services.AuditionProjectsCastingAboutService").updateaudprojects_castingabout(
        new_projName = new_projName,
        new_projtye = new_projtye,
        new_Status1 = new_Status1,
        new_Status2 = new_Status2,
        new_CastingAgency = new_CastingAgency,
        new_CastingDir = new_CastingDir,
        new_CastingAssociate = new_CastingAssociate,
        new_CastingAssistant = new_CastingAssistant,
        new_Notes1 = new_Notes1,
        new_Notes2 = new_Notes2,
        new_Notes3 = new_Notes3,
        new_CastingDir2 = new_CastingDir2,
        new_audnetwork = new_audnetwork,
        new_ID = new_ID
    )>
<cfcatch type="any">
    <cfset errorLog("[Error in audprojects_castingabout_ins_398_1.cfm]: " & cfcatch.message)>
</cfcatch>
</cftry>
