
<cftry>
    <cfset find_orphan = createObject("component", "/services/ContactItemService").getvm_contactitems_tags(userid=userid, tagname=left(y.tagname, 40))>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_orphan_298_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
