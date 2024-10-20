
<cftry>
    <cfset profiles = createObject("component", "/services/ContactItemService").getvm_contactitems_social_profile(contactID=contactid, userID=userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in profiles_516_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
