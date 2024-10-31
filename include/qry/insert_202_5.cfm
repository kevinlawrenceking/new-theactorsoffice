
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService.cfc" />
    <cfset variables.contactItemService.INScontactitems_24057(contactID=CONTACTID, company=Company) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_202_5.cfm]: #cfcatch.message#" />
        <cfthrow message="An error occurred while inserting contact item." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
