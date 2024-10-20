
<cftry>
    <cfset result = new services.AuditionToneUserService().insertaudtones_user(
        tone = "Custom",
        audcatid = audcatid,
        userid = userid
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming there's a function or query to update this in your application --->
<cfcatch type="any">
    <cfset errorLog = "[Error in insert_277_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
