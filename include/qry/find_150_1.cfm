
<cftry>
    <cfset find = createObject("component", "/services/LinkService").SELlinks(linkid=linkid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_150_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while fetching event ID by link ID." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
