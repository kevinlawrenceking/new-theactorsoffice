
<cftry>
    <cfset castingdirectors_sel = createObject("component", "/services/ContactItemService").getvm_contactitems_tags(userid=userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in castingdirectors_sel_445_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
