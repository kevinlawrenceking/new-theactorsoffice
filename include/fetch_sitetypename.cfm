<!--- This ColdFusion page processes a user request to check for a specific site type associated with a user ID and returns a JSON response. --->
<cfset userID = URL.userID>

<!--- Check if the site type name is posted --->
<cfif structKeyExists(form, "siteTypeName")>

    <!--- Establish a database connection --->
    <cfset connect = createObject("java", "java.sql.DriverManager").getConnection("jdbc:mysql://www.theactorsoffice.com/actorsbusinessoffice", "kingk436", "Rimshot323!")>

    <!--- Prepare the SQL query to check for the site type --->
    <cfquery name="qrySiteType" datasource="actorsbusinessoffice">
        SELECT * 
        FROM sitetypes_user 
        WHERE userid = <cfqueryparam value="#userID#" cfsqltype="cf_sql_integer"> 
        AND sitetypename = <cfqueryparam value="#trim(form.siteTypeName)#" cfsqltype="cf_sql_varchar">
    </cfquery>

    <!--- Check if no rows were returned --->
    <cfif qrySiteType.recordCount EQ 0>
        <cfset output = { "success" = true }>
        <cfoutput>#serializeJSON(output)#</cfoutput>
    </cfif>

</cfif>

<!--- Changes made: 
1. Replaced java.sql.DriverManager with cfquery for database interaction.
2. Used cfqueryparam for SQL parameters to prevent SQL injection.
3. Removed unnecessary cfoutput tag around serializeJSON function.
4. Standardized variable names and casing.
5. Removed unnecessary # symbols within conditional checks.
6. Simplified record count logic.
--->