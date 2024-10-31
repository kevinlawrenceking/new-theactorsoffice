<!--- This ColdFusion page handles user site URL submissions and checks for existing records in the database. --->
<cfif structKeyExists(url, "userID")>
    <cfset userID = url.userID>
    
    <!--- Check if site URL is submitted --->
    <cfif structKeyExists(form, "siteurl")>
        <cfset connect = createObject("java", "java.sql.DriverManager").getConnection("jdbc:mysql://www.theactorsoffice.com/actorsbusinessoffice", "kingk436", "Rimshot323!")>
        
        <!--- Prepare SQL query to check for existing site URL for the user --->
        <cfset query = "SELECT * FROM sitelinks_user WHERE userid = #userID# AND siteurl = '#trim(form.siteurl)#'">
        
        <cfset statement = connect.prepareStatement(query)>
        <cfset resultSet = statement.executeQuery()>
        
        <!--- Count the number of rows returned --->
        <cfset total_row = 0>
        <cfif resultSet.next()>
            <cfset total_row = total_row + 1>
        </cfif>
        
        <!--- Check if no records were found --->
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
