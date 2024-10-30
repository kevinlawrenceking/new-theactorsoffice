
<cftry>
    <cfset FindScope = createObject("component", "services.TagsUserService").SELtags_user_24341(new_contactid=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindScope_304_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
