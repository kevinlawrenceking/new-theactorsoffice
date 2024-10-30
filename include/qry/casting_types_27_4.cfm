
<cftry>
    <cfset casting_types = createObject("component", "services.TagsUserService").SELtags_user(userid=userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in casting_types_27_4.cfm]: #cfcatch.message#">
        <cfset casting_types = queryNew("id,name")>
    </cfcatch>
</cftry>
