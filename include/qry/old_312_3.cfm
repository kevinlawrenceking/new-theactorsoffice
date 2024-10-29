
<cftry>
    <cfset old = createObject("component", "services.TaoVersionService").getOldFindName(old_verid=old_verid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in old_312_3.cfm] #cfcatch.message#">
        <cfset old = queryNew("old_findname", "varchar")>
    </cfcatch>
</cftry>
