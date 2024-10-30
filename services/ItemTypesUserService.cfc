<cfcomponent displayname="ItemTypesUserService" hint="Handles operations for ItemTypesUser table" output="false"> 
<cffunction name="INSitemtypes_user" access="public" returntype="void">
    <cfargument name="customtype" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cftry>
        <cfquery datasource="abod">
            INSERT INTO itemtypes_user (valuetype, userid)
            VALUES (
                <cfqueryparam value="#arguments.customtype#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error in insertItemTypeUser: #cfcatch.message#">
            <cflog file="application" type="error" text="Query: INSERT INTO itemtypes_user (valuetype, userid) VALUES (?, ?)">
            <cflog file="application" type="error" text="Parameters: customtype=#arguments.customtype#, userid=#arguments.userid#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELitemtypes_user" access="public" returntype="query">
    <cfargument name="valuetype" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM itemtypes_user
            WHERE valuetype = <cfqueryparam value="#arguments.valuetype#" cfsqltype="CF_SQL_VARCHAR">
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getItemTypesByUser: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="INSitemtypes_user_24464" access="public" returntype="void">
    <cfargument name="valuetype" type="string" required="true">
    <cfargument name="typeicon" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO itemtypes_user (valuetype, typeicon, userid) 
            VALUES (
                <cfqueryparam value="#arguments.valuetype#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.typeicon#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in insertItemTypeUser: #cfcatch.message# - Query: INSERT INTO itemtypes_user (valuetype, typeicon, userid) VALUES (#arguments.valuetype#, #arguments.typeicon#, #arguments.userid#)">
            <cfthrow message="Database insertion error." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELitemtypes_user_24466" access="public" returntype="query">
    <cfargument name="valuetype" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT typeid
            FROM itemtypes_user
            WHERE valuetype = <cfqueryparam value="#arguments.valuetype#" cfsqltype="CF_SQL_VARCHAR">
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch>
            <cflog file="application" text="Error in getItemTypesByUser: #cfcatch.message#">
            <cfthrow message="An error occurred while fetching item types." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
