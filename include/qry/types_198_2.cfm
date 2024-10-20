
<cftry>
    <cfset types = createObject("component", "/services/ItemTypeService").getvm_itemtypes_itemcatxref(catid=4, excludeTypeId=1000)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in types_198_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
