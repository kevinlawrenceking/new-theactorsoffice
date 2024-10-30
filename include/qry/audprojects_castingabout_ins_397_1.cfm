
<cftry>
    <cfset objService = createObject("component", "services.AuditionProjectsCastingAboutService")>
    <cfset objService.INSaudprojects_castingabout(
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
        new_audnetwork = new_audnetwork
    )>
<cfcatch>
    <cflog text="[Error in audprojects_castingabout_ins_397_1.cfm] #cfcatch.message#" type="error" file="errorLog">
</cfcatch>
</cftry>
