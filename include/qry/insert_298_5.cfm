
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset variables.contactItemService.insertContactItem(contactID=CONTACTID, newValueText=left(new_valuetext, 40))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_298_5.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting contact item." detail="#cfcatch.message#">
    </cfcatch>
</cftry>
