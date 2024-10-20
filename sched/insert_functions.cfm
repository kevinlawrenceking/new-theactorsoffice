<cfquery name="getUniqueFunctions" datasource="abod">
    SELECT u.qry_type, u.qry_table, c.id AS component_id, c.component_name, c.filename
    FROM components c
    INNER JOIN unique_functions u ON u.qry_table = c.related_table;
</cfquery>

<cfloop query="getUniqueFunctions">
    <!-- Dynamically generate function names based on qry_type -->
    <cfset functionName = "">
    <cfif getUniqueFunctions.qry_type EQ 'SELECT'>
        <cfset functionName = "get" & REReplace(getUniqueFunctions.qry_table, "_tbl", "")>
    <cfelseif getUniqueFunctions.qry_type EQ 'INSERT'>
        <cfset functionName = "insert" & REReplace(getUniqueFunctions.qry_table, "_tbl", "")>
    <cfelseif getUniqueFunctions.qry_type EQ 'UPDATE'>
        <cfset functionName = "update" & REReplace(getUniqueFunctions.qry_table, "_tbl", "")>
    <cfelseif getUniqueFunctions.qry_type EQ 'DELETE'>
        <cfset functionName = "delete" & REReplace(getUniqueFunctions.qry_table, "_tbl", "")>
    </cfif>

    <!-- Insert the function record into the functions table -->
    <cfquery datasource="abod">
        INSERT INTO functions (component_id, displayname, qry_type, function_name)
        VALUES (
            <cfqueryparam value="#getUniqueFunctions.component_id#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#functionName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#getUniqueFunctions.qry_type#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#functionName#" cfsqltype="cf_sql_varchar">
        );
    </cfquery>
</cfloop>
