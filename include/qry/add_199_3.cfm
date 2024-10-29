
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset variables.contactItemService.insertContactItem(contactid=contactid, valuetype=trim(valuetype), valueCategory=valueCategory)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_199_3.cfm] #cfcatch.message#">
        <cfthrow message="Error inserting contact item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
