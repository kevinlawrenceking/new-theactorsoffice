<!--- This ColdFusion page processes a user request to check for a specific sitename associated with a user ID and returns a JSON response. --->

<cfif structKeyExists(url, "userID")>
    <cfset userID = url.userID>

    <!--- Check if sitename is posted --->
    <cfif structKeyExists(form, "sitename")>
        <cfset connect = createObject("java", "java.sql.DriverManager").getConnection("jdbc:mysql://www.theactorsoffice.com/actorsbusinessoffice", "kingk436", "Rimshot323!")>

        <!--- Prepare SQL query to select sitelinks for the user --->
        <cfset query = "SELECT * FROM sitelinks_user WHERE userid = #userID# AND sitename = '#trim(form.sitename)#'">
        <cfset statement = connect.createStatement()>

        <!--- Execute the query --->
        <cfset resultSet = statement.executeQuery(query)>

        <!--- Count total rows returned by the query --->
        <cfset total_row = 0>
        <cfloop condition="resultSet.next()">
            <cfset total_row = total_row + 1>
        </cfloop>

        <!--- Prepare JSON output based on the row count --->
        <cfif total_row EQ 0>
            <cfset output = { "success" = true }>
            <cfoutput>#serializeJSON(output)#</cfoutput>
        </cfif>

        <!--- Close the database connection --->
        <cfset resultSet.close()>
        <cfset statement.close()>
        <cfset connect.close()>
    </cfif>
</cfif>
