
<cftry>
    <cfset noteService = new "/services/NoteService.cfc" />
    <cfset noteService.updatenoteslog(
        noteDetails = LEFT(trim(noteDetails), 2000),
        notedetailshtml = trim(new_notetext),
        isPublic = isPublic,
        noteid = noteid
    ) />
    <cfset isfetch = 1 />
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming there's a mechanism to update this in the database, e.g., another function call or query --->
<cfcatch type="any">
    <cfset errorLog = "[Error in updatenote_175_1.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
