<cfcomponent displayname="ShareService" hint="Handles operations for Share table" > 
    <cffunction output="false" name="SELshares" access="public" returntype="query">
        <cfargument name="userId" type="numeric" required="true">

<cfquery name="result">
            SELECT *
            FROM shares
            WHERE userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

<cfreturn result>
    </cffunction>

    <cffunction name="shares" access="public" returntype="query" output="false">
        <cfargument name="userid" type="numeric" required="true">

        <cfquery name="result" >
            SELECT 
                contactid,
                Name,
                Company,
                Title,
                Audition,
                WhereMet,
                WhenMet,
                NotesLog,
                userid,
                u
            FROM 
                sharez
            WHERE 
                userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn result>
    </cffunction>
</cfcomponent>