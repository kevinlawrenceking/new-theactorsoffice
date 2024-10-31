<!--- This ColdFusion page handles user email validation by checking if the provided email exists for users other than the specified user ID. --->

<cfif structKeyExists(url, "userID")>
    <cfset userID = url.userID>
</cfif>

<cfif structKeyExists(form, "email")>
    <!--- Establish a database connection --->
    <cfset connect = createObject("java", "java.sql.DriverManager").getConnection("jdbc:mysql://www.theactorsoffice.com/actorsbusinessoffice", "kingk436", "Rimshot323!")>

    <!--- Prepare the SQL query to check for existing emails --->
    <cfset query = "SELECT * FROM taousers WHERE userid <> #userID# AND useremail = '#trim(form.email)#'">
    
    <cfset statement = connect.prepareStatement(query)>
    
    <!--- Execute the query --->
    <cfset resultSet = statement.executeQuery()>
    
    <!--- Count the number of rows returned --->
    <cfset total_row = 0>
    <cfloop while="resultSet.next()">
        <cfset total_row = total_row + 1>
    </cfloop>

    <cfif total_row EQ 0>
        <!--- Prepare the output response --->
        <cfset output = { "success" = true }>
        <cfoutput>#serializeJSON(output)#</cfoutput>
    </cfif>
</cfif>
