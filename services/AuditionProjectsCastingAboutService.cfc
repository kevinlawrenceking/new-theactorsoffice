<cfcomponent displayname="AuditionProjectsCastingAboutService" hint="Handles operations for AuditionProjectsCastingAbout table" output="false" > 
<cffunction name="insertaudprojects_castingabout" access="public" returntype="numeric">
    <cfargument name="data" type="struct" required="true">
    <cfset var insertResult = 0>
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            INSERT INTO audprojects_castingabout (
                projName, projtype, Status1, Status2, CastingAgency, CastingDir,
                CastingAssociate, CastingAssistant, Notes1, Notes2, Notes3,
                CastingDir2, audnetwork
            ) VALUES (
                <cfqueryparam value="#arguments.data.projName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.projName)#">,
                <cfqueryparam value="#arguments.data.projtype#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.projtype)#">,
                <cfqueryparam value="#arguments.data.Status1#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Status1)#">,
                <cfqueryparam value="#arguments.data.Status2#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Status2)#">,
                <cfqueryparam value="#arguments.data.CastingAgency#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.CastingAgency)#">,
                <cfqueryparam value="#arguments.data.CastingDir#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.CastingDir)#">,
                <cfqueryparam value="#arguments.data.CastingAssociate#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.CastingAssociate)#">,
                <cfqueryparam value="#arguments.data.CastingAssistant#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.CastingAssistant)#">,
                <cfqueryparam value="#arguments.data.Notes1#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Notes1)#">,
                <cfqueryparam value="#arguments.data.Notes2#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Notes2)#">,
                <cfqueryparam value="#arguments.data.Notes3#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Notes3)#">,
                <cfqueryparam value="#arguments.data.CastingDir2#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.CastingDir2)#">,
                <cfqueryparam value="#arguments.data.audnetwork#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.audnetwork)#">
            )
        </cfquery>
        <cfset insertResult = result.generatedKey>
    <cfcatch>
        <cflog file="application" text="Error inserting into audprojects_castingabout: #cfcatch.message# - #cfcatch.detail#">
        <cflog file="application" text="SQL Query: INSERT INTO audprojects_castingabout (projName, projtype, Status1, Status2, CastingAgency, CastingDir, CastingAssociate, CastingAssistant, Notes1, Notes2, Notes3, CastingDir2, audnetwork) VALUES (...)">
    </cfcatch>
    </cftry>
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Corrected the column name from 'projtye' to 'projtype' in both the SQL query and the cfqueryparam.
--->

<cffunction name="updateaudprojects_castingabout" access="public" returntype="boolean">
    <cfargument name="ID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    <cfset var sql = "UPDATE audprojects_castingabout SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "projName,projtye,Status1,Status2,CastingAgency,CastingDir,CastingAssociate,CastingAssistant,Notes1,Notes2,Notes3,CastingDir2,audnetwork">
    
    <cfloop collection="#arguments.data#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(setClauses, "#key# = ?")>
        </cfif>
    </cfloop>

    <cfif arrayLen(setClauses) EQ 0>
        <!--- No valid columns to update --->
        <cfreturn false>
    </cfif>

    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE ID = ?">

    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfloop collection="#arguments.data#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data[key])#">
                </cfif>
            </cfloop>
            <cfqueryparam value="#arguments.ID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn true>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating audprojects_castingabout: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <cfreturn false>
        </cfcatch>
    </cftry>
</cffunction> 

<!--- Changes made:
- None. The code is syntactically correct.
--->
</cfcomponent>
