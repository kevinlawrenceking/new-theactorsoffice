
<cftry>
    <cfset linkService = new "/services/LinkService.cfc"()>
    <cfset links = linkService.getLinksByNoteId(new_noteid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in links_181_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching links" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
