
<cftry>
    <cfset types = createObject("component", "/services/AuditionMediaTypeService").getvm_audmediatypes_mediatypeid([1, 2, 3, 5, 6, 7, 8])>
<cfcatch>
    <cfset errorLog = "[Error in types_44_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
