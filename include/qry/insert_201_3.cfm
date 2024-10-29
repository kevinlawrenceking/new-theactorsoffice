
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset variables.contactItemService.insertContactItem(contactID=CONTACTID, workEmail=workemail)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_201_3.cfm]: #cfcatch.message#">
        <cfthrow message="Error inserting contact item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
