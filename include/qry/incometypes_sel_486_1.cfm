
<cftry>
    <cfset incometypes_sel = createObject("component", "services.IncomeTypeService").getIncomeTypes()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in incometypes_sel_486_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching income types." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
