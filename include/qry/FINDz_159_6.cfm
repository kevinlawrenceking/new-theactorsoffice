
<cftry>
    <cfset FINDz = createObject("component", "services.ContactItemService").getContactItemsByContactId(deletecontactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FINDz_159_6.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
