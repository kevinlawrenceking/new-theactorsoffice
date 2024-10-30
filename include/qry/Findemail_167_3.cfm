
<cftry>
    <cfset Findemail = createObject("component", "services.ContactItemService").SELcontactitems_23964(contactID=myteam.contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findemail_167_3.cfm]: #cfcatch.message#">
        <cfthrow message="Error retrieving email." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
