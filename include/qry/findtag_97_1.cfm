
<cftry>
    <cfset findtag = createObject("component", "services.ContactItemService").getContactItems(contactid=myteam.contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findtag_97_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
