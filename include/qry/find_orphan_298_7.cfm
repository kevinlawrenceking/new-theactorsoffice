
<cftry>
    <cfset find_orphan = createObject("component", "services.ContactItemService").getContactItemsByTag(userid=userid, tagname=left(y.tagname, 40))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_orphan_298_7.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
