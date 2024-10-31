
<cftry>
    <cfset variables.contactItemService = createObject("component", "services.ContactItemService")>
    <cfset variables.contactItemService.INScontactitems_23771(new_contactid=new_contactid, cdco=cdco)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_28_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
