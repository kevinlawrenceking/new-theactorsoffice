
<cftry>
    <cfset items = createObject("component", "services.ContactItemService").getvm_contactitems_itemcategory(contactID=contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in items_488_1.cfm]: " & cfcatch.message>
        <!--- Log the error or handle it accordingly --->
    </cfcatch>
</cftry>
