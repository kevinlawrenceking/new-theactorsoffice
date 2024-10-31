
<cftry>
    <cfset contactItemService = createObject("component", "services.ContactItemService")>
    <cfset contactItemService.INScontactitems_24050(contactID=CONTACTID, workEmail=workemail)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_201_3.cfm]: #cfcatch.message#"/>
        <cfthrow message="Error calling INScontactitems_24050." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
