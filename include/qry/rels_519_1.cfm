
<cftry>
    <cfset rels = createObject("component", "services.SystemUserService").getvm_fusystemusers_fusystems(
        contactID=currentid,
        userID=session.userid,
        suStatus='Active'
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in rels_519_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
