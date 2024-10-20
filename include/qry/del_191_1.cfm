
<cftry>
    <cfset componentPath = "/services/AuditionProjectService.cfc">
    <cfset componentInstance = createObject("component", componentPath)>
    <cfset result = componentInstance.updateaudprojects(userid=userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in del_191_1.cfm]: " & cfcatch.message>
        <!--- Handle the error logging as needed --->
    </cfcatch>
</cftry>
