
<cftry>
    <cfset componentPath = "/services/AuditionProjectsCastingAboutService.cfc">
    <cfset component = createObject("component", componentPath)>
    <cfset component.updateAudprojectsCastingabout(
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
<cfcatch>
    <cflog file="errorLog"
           text="[Error in audprojects_castingabout_ins_398_1.cfm] Failed to update record. Error: #cfcatch.message#. Parameters: #serializeJSON({new_projName=new_projName, new_projtye=new_projtye, new_Status1=new_Status1, new_Status2=new_Status2, new_CastingAgency=new_CastingAgency, new_CastingDir=new_CastingDir, new_CastingAssociate=new_CastingAssociate, new_CastingAssistant=new_CastingAssistant, new_Notes1=new_Notes1, new_Notes2=new_Notes2, new_Notes3=new_Notes3, new_CastingDir2=new_CastingDir2, new_audnetwork=new_audnetwork, new_ID=new_ID})#"
           type='error'>
</cfcatch>
</cftry>
