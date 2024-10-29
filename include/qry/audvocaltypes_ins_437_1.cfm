
<cftry>
    <cfset objVocalTypeService = createObject("component", "services.AuditionVocalTypeService")>
    <cfset objVocalTypeService.insertVocalType(new_vocaltype=trim(new_vocaltype), new_isDeleted=new_isDeleted)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audvocaltypes_ins_437_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
