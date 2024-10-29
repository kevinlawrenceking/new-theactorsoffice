
<cftry>
    <cfset Findphone = createObject("component", "/services/ContactItemService").getActivePhone(contactID=audcontacts.contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findphone_48_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
