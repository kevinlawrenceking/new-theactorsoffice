
<cftry>
    <cfset mytags = createObject("component", "services.ContactItemService").SELcontactitems(contactId=audcontacts.contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mytags_48_1.cfm]: #cfcatch.message#">
        <cfset mytags = queryNew("contactid,itemid,tag,valuetext")>
    </cfcatch>
</cftry>
