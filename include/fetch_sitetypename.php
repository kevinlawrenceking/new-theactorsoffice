<!--- This ColdFusion page processes a user request to check for a specific site type associated with a user ID and returns a JSON response. --->

<cfset userID = URL.userID>

<!--- Check if the site type name is posted --->
<cfif structKeyExists(form, "sitetypename")>

    <!--- Establish a database connection --->
    <cfset connect = createObject("java", "java.sql.DriverManager").getConnection("jdbc:mysql://www.theactorsoffice.com/actorsbusinessoffice", "kingk436", "Rimshot323!")>

    <!--- Prepare the SQL query to check for the site type --->
    <cfset query = "SELECT * FROM sitetypes_user WHERE userid = #userID# AND sitetypename = '#trim(form.sitetypename)#'">

    <cfset statement = connect.prepareStatement(query)>

    <!--- Execute the query --->
    <cfset resultSet = statement.executeQuery()>

    <!--- Get the total number of rows returned --->
    <cfset total_row = resultSet.getMetaData().getColumnCount()>

    <!--- Check if no rows were returned --->
    <cfif total_row EQ 0>
        <cfset output = { "success" = true }>
        <cfoutput>#serializeJSON(output)#</cfoutput>
    </cfif>

</cfif>
