
<cftry>
    <cfset links = createObject("component", "/services/LinkService").getlinks(new_noteid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in links_181_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
