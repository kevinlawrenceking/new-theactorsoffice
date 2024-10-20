
<cftry>
    <cfset find = createObject("component", "/services/ContactService").getcontactdetails(
        contactFullName = "#x.fname# #x.lname#",
        userId = session.userid
    )>
    <cfset isfetch = 1>
    <!--- Update database to set isfetch = 1 --->
    <!--- Example: updateDatabaseFunction(isfetch) --->
<cfcatch type="any">
    <cfset errorLog = "[Error in find_315_4.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
