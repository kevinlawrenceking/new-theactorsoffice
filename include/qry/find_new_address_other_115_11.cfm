
<cftry>
    <cfset find_new_address_other = createObject("component", "services.ContactItemService").getContactAddress(new_contactid=new_contactid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_new_address_other_115_11.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
