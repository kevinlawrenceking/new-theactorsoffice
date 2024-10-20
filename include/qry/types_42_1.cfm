
<cftry>
    <cfset types = createObject("component", "services.AuditionMediaTypeService").getvm_audmediatypes_mediatypeid([9, 10, 11])>
    <cfcatch type="any">
        <cfset errorLog = "[Error in types_42_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
