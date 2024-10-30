
<cftry>
    <cfset cos = createObject("component", "services.AuditionProjectService").SELaudprojects_23795(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in cos_31_5.cfm]: #cfcatch.message#">
        <cfset cos = queryNew("valueCompany")>
    </cfcatch>
</cftry>
