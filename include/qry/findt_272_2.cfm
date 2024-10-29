
<cftry>
    <cfset findt = createObject("component", "services.ContactItemService").getActiveContactTags(ContactID=ContactID, new_tagname=new_tagname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findt_272_2.cfm]: #cfcatch.message#">
        <cfset findt = queryNew("valuetext")>
    </cfcatch>
</cftry>
