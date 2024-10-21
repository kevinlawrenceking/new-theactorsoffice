<cfquery name="getDistinctTables" datasource="abod">
SELECT DISTINCT m.displayname, m.tablename 
FROM tao_files f 
INNER JOIN models m ON m.tablename = f.qry_table
WHERE m.displayname IS NOT NULL 
ORDER BY m.displayname;
</cfquery>

<cfloop query="getDistinctTables">
    <cfset componentName = getDistinctTables.displayname & "Service">
    
    <!--- Insert into components table --->
    <cfquery datasource="abod">
        INSERT INTO components (component_name, related_table, filename, displayname, hint)
        VALUES (
            <cfqueryparam value="#componentName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#getDistinctTables.tablename#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="/services/#componentName#.cfc" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#componentName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="Handles operations for #getDistinctTables.displayname# table" cfsqltype="cf_sql_varchar">
        )
    </cfquery>
</cfloop>
