
<cftry>
    <cfset checkUnique = createObject("component", "services.ContactService").getContactId(addDaysNoUniqueName=adddaysno.uniquename, contactId=contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in checkUnique_157_8.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
