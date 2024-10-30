
<cftry>
    <cfset Findemail = createObject("component", "/services/ContactItemService").SELcontactitems_23759(contactID=audcontacts.contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findemail_48_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
