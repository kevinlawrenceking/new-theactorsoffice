
<cftry>
    <cfset result = createObject("component", "/services/AuditionVocalTypeService").updateaudvocaltypes(
        new_vocaltype=new_vocaltype,
        new_isDeleted=new_isDeleted,
        new_vocaltypeid=new_vocaltypeid
    )>
<cfcatch type="any">
    <cfset errorLog = "[Error in audvocaltypes_ins_439_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
