
<cftry>
    <!--- This ColdFusion page retrieves the event ID associated with a specific link ID from the database. --->
    <cfset find = createObject("component", "/services/LinkService").getvm_links_noteslog(linkid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in find_150_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
