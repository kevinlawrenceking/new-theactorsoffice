
<cftry>
    <cfset find_new_BusinessEmail = createObject("component", "services.ContactItemService").SELcontactitems_23890(new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_new_BusinessEmail_115_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
