
<cftry>
    <cfset mytags = createObject("component", "/services/ContactItemService").getcontactitems(audcontacts.contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in mytags_48_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
