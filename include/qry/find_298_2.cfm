
<cftry>
    <cfset find = createObject("component", "services.TagsUserService").getUserTags(new_valuetext=left(new_valuetext, 40), userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_298_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
