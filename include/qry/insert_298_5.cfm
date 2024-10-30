
<!--- This ColdFusion page handles the insertion of contact items into the database. --->

<cftry>
    <cfset contactItemService = createObject("component", "services.ContactItemService")>
    <cfset contactItemService.INScontactitems_24327(contactID=CONTACTID, newValueText=left(new_valuetext, 40))>
    
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_298_5.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting contact item." detail="#cfcatch.message#">
    </cfcatch>
</cftry>
