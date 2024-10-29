
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc" />
    <cfset contactItemService.updateContactItems(
        itemid = findsame.itemid,
        new_currentStartDate = new_currentStartDate
    ) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_305_4.cfm] #cfcatch.message#" />
        <cfthrow message="An error occurred while updating the contact items." detail="#cfcatch.message#" />
    </cfcatch>
</cftry>
