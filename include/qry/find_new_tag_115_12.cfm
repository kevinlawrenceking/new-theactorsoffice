
<cftry>
    <cfset find_new_tag = createObject("component", "services.ContactItemService").SELcontactitems_23898(contactID=new_contactid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_new_tag_115_12.cfm]: #cfcatch.message#">
        <cfset find_new_tag = queryNew("tag", "varchar")>
    </cfcatch>
</cftry>
