
<cftry>
    <cfset old = createObject("component", "services.TaoVersionService").SELtaoversions_24386(old_verid=old_verid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in old_312_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
