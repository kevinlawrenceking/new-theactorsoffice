
<cftry>
    <cfset find_new_WorkPhone = createObject("component", "services.ContactItemService").SELcontactitems_23893(new_contactid=new_contactid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_new_WorkPhone_115_7.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving work phone." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
