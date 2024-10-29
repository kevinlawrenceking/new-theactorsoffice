
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset contactItemService.insertContactItem(contactID=CONTACTID, workPhone=Workphone)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_201_4.cfm]: #cfcatch.message#">
        <cfthrow message="Error inserting contact item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
