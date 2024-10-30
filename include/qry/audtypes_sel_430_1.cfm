
<cftry>
    <cfset auditionTypeService = createObject("component", "services.AuditionTypeService")>
    <cfset audtypes_sel = auditionTypeService.SELaudtypes_24608(isDeleted=false)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audtypes_sel_430_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
