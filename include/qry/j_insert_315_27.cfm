
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset variables.contactItemService.insertContactItem(contactid=j.contactid, company=j.company)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in j_insert_315_27.cfm]: #cfcatch.message#">
    <cflog file="errorLog" text="Query Error: #cfcatch.detail#">
    <cflog file="errorLog" text="Parameters: contactid=#j.contactid#, company=#j.company#">
    <cfthrow message="Database error occurred while inserting contact item.">
</cfcatch>
</cftry>
