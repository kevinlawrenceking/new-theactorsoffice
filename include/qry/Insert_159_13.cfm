
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset variables.contactItemService.insertContactItem(
        contactID = currentid, 
        valueTypeDef = categories.valueTypeDef, 
        valuecategory = categories.valuecategory
    )>
    <!--- Update database to set isfetch = 1 --->
    <cfquery datasource="abod">
        UPDATE someTable SET isfetch = 1 WHERE someCondition
    </cfquery>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Insert_159_13.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
