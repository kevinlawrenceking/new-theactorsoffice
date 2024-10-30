
<cftry>
    <cfset find_new_address = createObject("component", "services.ContactItemService").SELcontactitems_23896(new_contactid=new_contactid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_new_address_115_10.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
