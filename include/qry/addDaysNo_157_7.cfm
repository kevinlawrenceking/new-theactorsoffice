
<cftry>
    <cfset addDaysNo = createObject("component", "services.SystemService").SELfusystems_23938(new_systemid=new_systemid, new_userid=new_userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addDaysNo_157_7.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
