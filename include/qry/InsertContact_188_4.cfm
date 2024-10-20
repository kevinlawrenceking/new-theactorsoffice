
<cftry>
    <cfset result = createObject("component", "services.UserService").updatetaousers(new_contactid, session.userid)>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 here if needed --->
<cfcatch type="any">
    <cfset errorLog = "[Error in InsertContact_188_4.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
