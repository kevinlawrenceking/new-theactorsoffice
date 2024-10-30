
<cftry>
    <cfset variables.contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset variables.contactItemService.UPDcontactitems_24179(valuetype=valuetype, itemid=itemid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in update2_262_6.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
