
<cftry>
    <cfset reportItemService = new "/services/ReportItemService.cfc"()>
    <cfset reportItemService.updateReportItems(new_itemvalueint=new_itemvalueint, new_itemid=new_itemid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_282_8.cfm]: #cfcatch.message#">
        <cfthrow message="Error updating reportitems." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
