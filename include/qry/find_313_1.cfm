
<cftry>
    <cfset find = createObject("component", "services.AuditionCategoryService").getvm_audcategories_audsubcategories(form.audsubcatid)>
<cfcatch>
    <cfset errorLog = "[Error in find_313_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
