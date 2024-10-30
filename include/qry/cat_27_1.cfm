
<cftry>
    <cfset cat = createObject("component", "services.AuditionCategoryService").SELaudcategories(new_audsubcatid=new_audsubcatid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in cat_27_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
