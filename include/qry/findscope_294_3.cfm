
<cftry>
    <cfset findscope = createObject("component", "/services/ContactItemService").getvm_contactitems_tags(contactid, userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findscope_294_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
