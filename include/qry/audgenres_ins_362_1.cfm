<cfset auditionGenreService = createObject("component", "services.AuditionGenreService")>
<cfset result = auditionGenreService.INSaudgenres(
    new_audgenre = trim(new_audgenre),
    new_audCatid = new_audCatid,
    new_isDeleted = new_isDeleted
)>