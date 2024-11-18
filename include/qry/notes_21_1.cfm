<cfset notesService = createObject("component", "services.NoteService")>
<cfset notes = notesService.*(noteid=noteid)>