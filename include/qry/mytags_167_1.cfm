
<cftry>
    <cfset mytags = createObject("component", "services.ContactItemService").getContactItems(contactId=myteam.contactid) />
    <cfcatch type="any">
        <cflog text="[Error in mytags_167_1.cfm]: #cfcatch.message#" type="errorLog" />
    </cfcatch>
</cftry>
