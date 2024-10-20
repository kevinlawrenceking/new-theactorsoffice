
<cftry>
    <cfset cat = createObject("component", "services.AuditionCategoryService").getvm_audcategories_audsubcategories(new_audsubcatid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in cat_27_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
