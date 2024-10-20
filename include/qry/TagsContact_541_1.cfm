
<cftry>
    <cfset TagsContact = createObject("component", "services.ContactItemService").getcontactitems(ContactID)>
<cfcatch>
    <cfset errorLog = "[Error in TagsContact_541_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
