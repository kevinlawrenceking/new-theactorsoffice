
<cftry>
    <cfset find_new_homePhone = createObject("component", "services.ContactItemService").getNewHomePhone(new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_new_homePhone_115_9.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
