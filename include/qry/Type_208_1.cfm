
<cftry>
    <cfset Type = createObject("component", "/services/AuditionMediaTypeService").getaudmediatypes(src)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Type_208_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
