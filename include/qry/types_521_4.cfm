
<cftry>
    <cfset types = createObject("component", "services.ItemCategoryService").SELitemcategory_24722(new_catid=new_catid, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_521_4.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching distinct value types." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
