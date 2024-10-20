
<cftry>
    <cfset find = createObject("component", "/services/AuditionProjectService").getaudprojects(
        projname = y.projname,
        userid = session.userid,
        isdeleted = 0
    )>
    <cfcatch>
        <cfset errorLog = "[Error in find_308_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
