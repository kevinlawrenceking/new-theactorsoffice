
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset variables.contactItemService.INScontactitems_24052(CONTACTID=CONTACTID, Company=Company)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_201_5.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
