
<cftry>
    <cfset Find = createObject("component", "services.ContactItemService").SELcontactitems_23954(currentid=currentid, valuecategory=categories.valuecategory)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in Find_159_12.cfm]: #cfcatch.message#">
        <cfthrow message="Error in Find_159_12.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
