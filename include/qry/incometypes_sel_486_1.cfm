
<cftry>
    <cfset incometypes_sel = createObject("component", "services.IncomeTypeService").getincometypes()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in incometypes_sel_486_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
