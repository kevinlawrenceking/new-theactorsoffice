<cfcomponent displayname="ShareService" hint="Handles operations for Share table" > 


    <cffunction name="GetShareDetails" access="public" returntype="query" output="false">
        <!--- Arguments --->
        <cfargument name="contactid" type="numeric" required="true">

        <!--- Query --->
        <cfquery name="result">
            SELECT 
                `Name`,
                `Company`,
                `Title`,
                `WhereMet`,
                `WhenMet`,
                `NotesLog`
            FROM 
                sharez
            WHERE 
                contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- Return Query Result --->
        <cfreturn result>
    </cffunction>

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