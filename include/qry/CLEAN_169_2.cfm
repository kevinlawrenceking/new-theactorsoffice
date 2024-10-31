
<cftry>
    <cfset noteService = createObject("component", "services.NoteService")>
    <cfset noteService.UPDnoteslog_23967(
        noteDetailsHtml = '<input type="text" data-formula="e=mc^2" data-link="https://quilljs.com" data-video="Embed URL">'
    )>
<cfcatch type="any">
    <cflog file="errorLog" type="error" text="[Error in CLEAN_169_2.cfm] #cfcatch.message#">
</cfcatch>
</cftry>
