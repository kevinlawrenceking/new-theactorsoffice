
<cftry>
    <cfset objContactItemService = createObject("component", "services.ContactItemService")>
    <cfset objContactItemService.insertContactItem(CONTACTID=CONTACTID, Company=Company)>
<cfcatch>
    <cflog file="errorLog" text="[Error in insert_201_5.cfm]: #cfcatch.message#">
    <cfthrow>
</cfcatch>
</cftry>
