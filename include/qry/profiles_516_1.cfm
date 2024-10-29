
<cftry>
    <cfset profiles = createObject("component", "/services/ContactItemService").getSocialProfileItems(contactid=contactid, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in profiles_516_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
