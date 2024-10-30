
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset contactItemService.INScontactitems_24051(contactID=CONTACTID, workPhone=Workphone)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_201_4.cfm]: #cfcatch.message#">
        <cfthrow message="Error calling INScontactitems_24051." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
