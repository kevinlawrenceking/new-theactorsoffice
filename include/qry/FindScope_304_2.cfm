
<cftry>
    <cfset FindScope = createObject("component", "/services/TagsUserService").getvm_tags_user_contactdetails(new_contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindScope_304_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
