
<cftry>
    <cfset types = createObject("component", "/services/AuditionMediaTypeService").getvm_audmediatypes_mediatypeid()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in types_45_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
