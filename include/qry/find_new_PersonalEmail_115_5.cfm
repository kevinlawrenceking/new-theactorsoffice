
<cftry>
    <cfset find_new_PersonalEmail = createObject("component", "/services/ContactItemService").SELcontactitems_23891(new_contactid=new_contactid) />
    <cfcatch>
        <cflog file="errorLog" text="[Error in find_new_PersonalEmail_115_5.cfm]: #cfcatch.message#" type="error">
        <cfthrow message="An error occurred while retrieving the personal email." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
