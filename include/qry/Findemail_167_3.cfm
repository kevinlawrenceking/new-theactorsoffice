
<cftry>
    <cfset Findemail = createObject("component", "services.ContactItemService").getActiveEmail(contactID=myteam.contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findemail_167_3.cfm]: #cfcatch.message#">
        <cfthrow message="Error retrieving email." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
