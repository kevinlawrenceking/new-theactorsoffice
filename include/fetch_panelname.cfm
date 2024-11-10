<!--- This ColdFusion page processes a user ID and checks if a specific site type name exists for that user in the database. It returns a JSON response indicating success or failure. --->

<cfset userID = url.userID>

<!--- Check if the site type name is submitted via POST --->
<cfif structKeyExists(form, "sitetypename")>
    
    <!--- Establish a database connection --->
    <cfset connect = createObject("java", "java.sql.DriverManager").getConnection("jdbc:mysql://www.theactorsoffice.com/actorsbusinessoffice", "kingk436", "Rimshot323!")>
    
    <!--- Prepare the SQL query to check for the site type name --->
    <cfset query = "SELECT sitetypename FROM sitetypes_user WHERE userid = #userID# AND sitetypename = '#trim(form.sitetypename)#'">
    
    <cfset statement = connect.prepareStatement(query)>
    
    <!--- Execute the query --->
    <cfset resultSet = statement.executeQuery()>
    
    <!--- Count the total rows returned --->
    <cfset total_row = 0>
    <cfloop condition="resultSet.next()">
        <cfset total_row = total_row + 1>
    </cfloop>
    
    <!--- Check if no rows were returned --->
    <cfif total_row EQ 0>
        <cfset output = { "success" = true }>
        <cfoutput>#serializeJSON(output)#</cfoutput>
    </cfif>
    
</cfif>
