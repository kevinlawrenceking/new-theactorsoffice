
<cftry>
    <cfset find_new_address = createObject("component", "services.ContactItemService").getBusinessAddress(new_contactid=new_contactid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_new_address_115_10.cfm]: #cfcatch.message#" />
        <cfset find_new_address = queryNew("new_address,new_address2,new_city,new_state,new_zip", "varchar,varchar,varchar,varchar,varchar") />
    </cfcatch>
</cftry>
