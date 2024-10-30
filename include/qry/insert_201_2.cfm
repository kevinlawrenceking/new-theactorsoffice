
<cftry>
    <cfset objContactItemService = createObject("component", "/services/ContactItemService")>
    <cfset objContactItemService.INScontactitems_24049(contactID=CONTACTID, tag=tag)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_201_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting contact item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
