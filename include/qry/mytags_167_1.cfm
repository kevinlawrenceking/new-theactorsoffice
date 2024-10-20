
<cftry>
    <cfset mytags = createObject("component", "/services/ContactItemService").getcontactitems(myteam.contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mytags_167_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
