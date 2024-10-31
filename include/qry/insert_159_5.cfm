
<cftry>
    <cfset contactItemService = createObject("component", "services.ContactItemService")>
    <cfset contactItemService.INScontactitems_23947(new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_159_5.cfm]: #cfcatch.message#">
        <cfthrow message="Error inserting contact item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
