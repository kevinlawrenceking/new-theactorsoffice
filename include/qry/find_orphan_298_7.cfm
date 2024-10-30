
<cftry>
    <cfset contactItemService = createObject("component", "services.ContactItemService")>
    <cfset find_orphan = contactItemService.SELcontactitems_24329(userid=userid, tagname=left(y.tagname, 40))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_orphan_298_7.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
