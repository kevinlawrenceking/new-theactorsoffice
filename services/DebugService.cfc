<cfcomponent displayname="DebugService" hint="Handles debug logging">

    <cffunction name="insertDebugLog" access="public" returntype="void" output="false" hint="Logs debugging information into the debugLog table.">
        <cfargument name="filename" type="string" required="true" hint="The script or file name being debugged.">
        <cfargument name="debugDetails" type="string" required="true" hint="Serialized debug information.">

        <cfquery>
            INSERT INTO debugLog (filename, debugDetails)
            VALUES (
                <cfqueryparam value="#arguments.filename#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.debugDetails#" cfsqltype="CF_SQL_LONGVARCHAR">
            )
        </cfquery>
    </cffunction>

</cfcomponent>
