<cfcomponent displayname="AuditionOpenCallOptionUserService" hint="Handles operations for AuditionOpenCallOptionUser table" output="false"> 
<cffunction name="getOpenCallOptions" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT opencallid, opencallname
            FROM audopencalloptions_user
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY opencallname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getOpenCallOptions: #cfcatch.message# Query: SELECT opencallid, opencallname FROM audopencalloptions_user WHERE userid = ? ORDER BY opencallname Parameters: userid=#arguments.userid#">
            <cfset result = queryNew("opencallid,opencallname")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getOpenCallOptions" access="public" returntype="query">
    <cfargument name="new_opencallid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT opencallid, opencallname
            FROM audopencalloptions_user
            WHERE opencallid = <cfqueryparam value="#arguments.new_opencallid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getOpenCallOptions: #cfcatch.message# Query: SELECT opencallid, opencallname FROM audopencalloptions_user WHERE opencallid = #arguments.new_opencallid#">
            <cfset result = queryNew("opencallid, opencallname", "integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getOpenCallOptions" access="public" returntype="query">
    <cfargument name="new_opencallname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT *
            FROM audopencalloptions_user
            WHERE opencallname = <cfqueryparam value="#arguments.new_opencallname#" cfsqltype="CF_SQL_VARCHAR">
            AND userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getOpenCallOptions: #cfcatch.message# Query: SELECT * FROM audopencalloptions_user WHERE opencallname = ? AND userid = ? Parameters: #arguments.new_opencallname#, #arguments.userid#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="insertAudOpenCallOptionsUser" access="public" returntype="void">
    <cfargument name="new_opencallname" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audopencalloptions_user (opencallname, userid, isdeleted)
            VALUES (
                <cfqueryparam value="#arguments.new_opencallname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in insertAudOpenCallOptionsUser: #cfcatch.message#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
