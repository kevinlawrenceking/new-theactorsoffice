
<cftry>
    <cfset types = createObject("component", "services.ItemTypeService").SELitemtypes(catId=4, excludeTypeId=1000)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in types_198_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
