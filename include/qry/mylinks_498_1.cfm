
<cftry>
    <cfset mylinks = createObject("component", "/services/ContactItemService").getvm_contactitems_social_profile(userContactID)>
<cfcatch type="any">
    <cfset errorLog = "[Error in mylinks_498_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
