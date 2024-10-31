
<cftry>
    <cfset contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset contactItemService.UPDcontactitems_24178(
        valuetext=trim(valuetext),
        valuetype=trim(valuetype),
        catid=catid,
        valuecompany=valuecompany,
        custom=custom,
        valueDepartment=valueDepartment,
        valueTitle=valueTitle,
        valueStreetAddress=valueStreetAddress,
        valueExtendedAddress=valueExtendedAddress,
        valueCity=valueCity,
        new_region_id=new_region_id,
        new_countryid=new_countryid,
        valuePostalCode=valuePostalCode,
        itemdate=itemdate,
        deleteitem=deleteitem,
        itemid=itemid
    )>
    <cfquery datasource="#application.datasource#">
        UPDATE database SET isfetch = 1 WHERE some_condition
    </cfquery>
<cfcatch>
    <cflog file="errorLog" text="[Error in update_262_5.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
