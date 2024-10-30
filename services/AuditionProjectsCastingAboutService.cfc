<cfcomponent displayname="AuditionProjectsCastingAboutService" hint="Handles operations for AuditionProjectsCastingAbout table" output="false"> 
<cffunction name="INSaudprojects_castingabout" access="public" returntype="void">
    <cfargument name="new_projName" type="string" required="true">
    <cfargument name="new_projtye" type="string" required="true">
    <cfargument name="new_Status1" type="string" required="true">
    <cfargument name="new_Status2" type="string" required="true">
    <cfargument name="new_CastingAgency" type="string" required="true">
    <cfargument name="new_CastingDir" type="string" required="true">
    <cfargument name="new_CastingAssociate" type="string" required="true">
    <cfargument name="new_CastingAssistant" type="string" required="true">
    <cfargument name="new_Notes1" type="string" required="true">
    <cfargument name="new_Notes2" type="string" required="true">
    <cfargument name="new_Notes3" type="string" required="true">
    <cfargument name="new_CastingDir2" type="string" required="true">
    <cfargument name="new_audnetwork" type="string" required="true">

    <cftry>
        <cfquery datasource="#yourDataSource#" name="insertQuery">
            INSERT INTO audprojects_castingabout (
                projName, projtye, Status1, Status2, CastingAgency, 
                CastingDir, CastingAssociate, CastingAssistant, 
                Notes1, Notes2, Notes3, CastingDir2, audnetwork
            ) VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_projName#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_projtye#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_Status1#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_Status2#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_CastingAgency#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_CastingDir#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_CastingAssociate#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_CastingAssistant#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_Notes1#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_Notes2#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_Notes3#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_CastingDir2#" maxlength="500">,
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audnetwork#" maxlength="500">
            )
        </cfquery>
        <cflog text="[INFO] Insert successful for project: #arguments.new_projName#." type='information'>
    <cfcatch>
        <cflog text="[ERROR] Error inserting project: #arguments.new_projName#. Error: #cfcatch.message#." type='error'>
        <!--- Handle error appropriately --->
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudprojects_castingabout" access="public" returntype="void">
    <cfargument name="new_projName" type="string" required="true">
    <cfargument name="new_projtye" type="string" required="true">
    <cfargument name="new_Status1" type="string" required="true">
    <cfargument name="new_Status2" type="string" required="true">
    <cfargument name="new_CastingAgency" type="string" required="true">
    <cfargument name="new_CastingDir" type="string" required="true">
    <cfargument name="new_CastingAssociate" type="string" required="true">
    <cfargument name="new_CastingAssistant" type="string" required="true">
    <cfargument name="new_Notes1" type="string" required="true">
    <cfargument name="new_Notes2" type="string" required="true">
    <cfargument name="new_Notes3" type="string" required="true">
    <cfargument name="new_CastingDir2" type="string" required="true">
    <cfargument name="new_audnetwork" type="string" required="true">
    <cfargument name="new_ID" type="numeric" required="true">

    <cftry>
        <cfquery datasource="#yourDataSource#" name="updateQuery">
            UPDATE audprojects_castingabout
            SET 
                projName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_projName#" maxlength="500" null="#NOT len(trim(arguments.new_projName))#">,
                projtye = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_projtye#" maxlength="500" null="#NOT len(trim(arguments.new_projtye))#">,
                Status1 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_Status1#" maxlength="500" null="#NOT len(trim(arguments.new_Status1))#">,
                Status2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_Status2#" maxlength="500" null="#NOT len(trim(arguments.new_Status2))#">,
                CastingAgency = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_CastingAgency#" maxlength="500" null="#NOT len(trim(arguments.new_CastingAgency))#">,
                CastingDir = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_CastingDir#" maxlength="500" null="#NOT len(trim(arguments.new_CastingDir))#">,
                CastingAssociate = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_CastingAssociate#" maxlength="500" null="#NOT len(trim(arguments.new_CastingAssociate))#">,
                CastingAssistant = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_CastingAssistant#" maxlength="500" null="#NOT len(trim(arguments.new_CastingAssistant))#">,
                Notes1 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_Notes1#" maxlength="500" null="#NOT len(trim(arguments.new_Notes1))#">,
                Notes2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_Notes2#" maxlength="500" null="#NOT len(trim(arguments.new_Notes2))#">,
                Notes3 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_Notes3#" maxlength="500" null="#NOT len(trim(arguments.new_Notes3))#">,
                CastingDir2 = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_CastingDir2#" maxlength="500" null="#NOT len(trim(arguments.new_CastingDir2))#">,
                audnetwork = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audnetwork#" maxlength="500" null="#NOT len(trim(arguments.new_audnetwork))#">
            WHERE ID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_ID#">
        </cfquery>
        <!--- Additional logic for successful update can be added here --->
    <cfcatch>
        <!--- Log the error details --->
        <cflog file="/path/to/logfile.log"
               text="[Error] Failed to update record in audprojects_castingabout. Error: #cfcatch.message#. Query: #updateQuery.sql#. Parameters: #serializeJSON(arguments)#"
               type='error'>
        <!--- Handle error appropriately, e.g., rethrow, custom error message, etc. --->
        <!--- Example: rethrow; --->
    </cfcatch>
    </cftry>
</cffunction></cfcomponent>
