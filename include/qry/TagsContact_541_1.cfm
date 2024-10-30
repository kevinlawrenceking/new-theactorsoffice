
<cftry>
    <cfset TagsContact = createObject("component", "services.ContactItemService").SELcontactitems_24764(ContactID=ContactID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in TagsContact_541_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
