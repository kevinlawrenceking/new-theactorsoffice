
<cftry>
    <cfset findscope = createObject("component", "/services/ContactItemService").getvm_contactitems_tags(contactid, session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findscope_539_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
