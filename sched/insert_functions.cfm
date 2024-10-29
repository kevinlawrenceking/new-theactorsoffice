<cfquery name="getUniqueFunctions" datasource="abod">
    SELECT DISTINCT t.id as unique_id, c.id AS component_id, t.qry_type, t.qry_table, t.qry_details
    FROM tao_files t
    INNER JOIN components c ON c.related_table = t.qry_table
    INNER JOIN unique_functions u ON u.qry_table = c.related_table
    WHERE t.qry_table IS NOT NULL 
    AND t.function_id IS NULL
</cfquery>

<cfloop query="getUniqueFunctions">
    <!--- Dynamically generate function names based on qry_type --->
  
 
     <cfset functionName = getUniqueFunctions.qry_type & REReplace(getUniqueFunctions.qry_table, "_tbl", "")>

    <!--- Check if functionName already exists --->
    <cfquery name="checkFunctionName" datasource="abod">
        SELECT COUNT(*) AS nameCount
        FROM functions
        WHERE function_name = <cfqueryparam value="#functionName#" cfsqltype="cf_sql_varchar">
    </cfquery>

    <!--- If functionName is not unique, append unique_id --->
    <cfif checkFunctionName.nameCount GT 0>
        <cfset functionName = functionName & "_" & getUniqueFunctions.unique_id>
    </cfif>

    <!--- Insert the function record into the functions table --->
    <cfquery name="insertFunction" datasource="abod" result="insertResult">
        INSERT INTO functions (component_id, displayname, qry_type, function_name)
        VALUES (
            <cfqueryparam value="#getUniqueFunctions.component_id#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#functionName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#getUniqueFunctions.qry_type#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#functionName#" cfsqltype="cf_sql_varchar">
        );
    </cfquery>

    <!--- Update the tao_files table with the new function_id --->
    <cfquery datasource="abod">
        UPDATE tao_files
        SET function_id = <cfqueryparam value="#insertResult.generatedKey#" cfsqltype="cf_sql_integer">
        WHERE id = <cfqueryparam value="#getUniqueFunctions.unique_id#" cfsqltype="cf_sql_integer">
 
    </cfquery>
</cfloop>
