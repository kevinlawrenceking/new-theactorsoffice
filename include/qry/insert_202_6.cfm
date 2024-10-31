
<cftry>
    <cfset variables.contactItemService = createObject("component", "services.ContactItemService")>
    <cfset variables.contactItemService.INScontactitems_24058(CONTACTID=#CONTACTID#, Company_new="#Company_new#")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_202_6.cfm]: #cfcatch.message#">
        <cfthrow message="Error inserting contact item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
