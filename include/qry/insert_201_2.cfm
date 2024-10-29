
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset contactItemService.insertContactItem(contactID=CONTACTID, tag=tag)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_201_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting contact item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
