
<cftry>
    <cfset Findphone = createObject("component", "services.ContactItemService").getActivePhone(contactID=myteam.contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Findphone_167_2.cfm]: #cfcatch.message#">
        <cfset Findphone = queryNew("phone", "varchar")>
    </cfcatch>
</cftry>
