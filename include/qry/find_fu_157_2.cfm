
<cftry>
    <cfset find_fu = createObject("component", "services.SystemService").SELfusystems_23933(
        new_userid = new_userid,
        new_contactid = new_contactid,
        new_systemid = new_systemid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_fu_157_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
