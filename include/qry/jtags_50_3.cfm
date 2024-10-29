
<cftry>
    <cfset jtags = createObject("component", "/services/TagsUserService").getUserTags(userId=session.userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in jtags_50_3.cfm]: #cfcatch.message#" />
        <cfset jtags = queryNew("col1") />
    </cfcatch>
</cftry>
