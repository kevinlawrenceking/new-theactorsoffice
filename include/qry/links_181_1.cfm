
<cftry>
    <cfset links = createObject("component", "services.LinkService").SELlinks_23981(new_noteid=new_noteid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in links_181_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching links" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
