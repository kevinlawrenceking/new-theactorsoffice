
<cftry>
    <cfset result = createObject("component", "/services/ContactService").insertcontactdetails(
        ContactFullName = "#finduser.userfirstname# #finduser.userlastname#",
        userid = session.userid,
        user_yn = "Y"
    )>
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 --->
    <!--- Assuming there is a function or query to update the database, call it here --->
    <!--- Example: updateDatabaseWithFetchStatus(isfetch) --->
<cfcatch type="any">
    <cfset errorLog = "[Error in InsertContact_188_3.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
