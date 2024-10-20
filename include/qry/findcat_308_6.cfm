
<cftry>
    <cfset findcat = createObject("component", "services.AuditionCategoryService").getaudcategories(y.audcatname)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findcat_308_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
