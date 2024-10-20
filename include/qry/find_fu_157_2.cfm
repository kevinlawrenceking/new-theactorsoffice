
<cftry>
    <cfset find_fu = createObject("component", "services.SystemService").getvm_fusystems_fusystemusers(
        new_userid = new_userid,
        new_contactid = new_contactid,
        new_systemid = new_systemid
    )>
<cfcatch type="any">
    <cfset errorLog = "[Error in find_fu_157_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
