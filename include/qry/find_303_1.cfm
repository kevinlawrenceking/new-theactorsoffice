
<cftry>
    <cfset find = createObject("component", "services.TaoVersionService").SELtaoversions_24331(datasource="abodName")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_303_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
