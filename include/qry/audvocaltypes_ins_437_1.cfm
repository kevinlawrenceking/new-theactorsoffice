
<cftry>
    <cfset variables.vocalTypeService = createObject("component", "services.AuditionVocalTypeService")>
    <cfset variables.vocalTypeService.INSaudvocaltypes(new_vocaltype=new_vocaltype, new_isDeleted=new_isDeleted)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audvocaltypes_ins_437_1.cfm]: #cfcatch.message#"/>
        <cfrethrow/>
    </cfcatch>
</cftry>
