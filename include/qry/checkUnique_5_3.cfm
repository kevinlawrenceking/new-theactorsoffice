
<cftry>
    <cfset checkUnique = createObject("component", "services.ContactService").getContactId(addDaysNoUniqueName=adddaysno.uniquename, newContactId=new_contactid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in checkUnique_5_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
