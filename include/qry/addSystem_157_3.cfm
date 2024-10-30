
<cftry>
    <cfset result = createObject("component", "services.SystemUserService").INSfusystemusers_23934(
        new_systemid = new_systemid,
        new_contactid = new_contactid,
        new_userid = new_userid,
        suStartDate = suStartDate,
        sunotes = sunotes
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in addSystem_157_3.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
