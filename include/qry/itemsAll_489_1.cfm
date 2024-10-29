
<cftry>
    <cfset itemsAll = createObject("component", "services.ContactItemService").getContactItems(currentid=currentid, catArea_UCB=catArea_UCB)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in itemsAll_489_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
