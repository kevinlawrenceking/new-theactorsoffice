<cfcomponent displayname="ItemCategoryXRefUserService" hint="Handles operations for ItemCategoryXRefUser table" output="false"> 
<cffunction name="INSitemcatxref_user" access="public" returntype="void">
    <cfargument name="new_typeid" type="numeric" required="true">
    <cfargument name="catid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO itemcatxref_user (typeid, catid, userid, IsCustom) 
            VALUES (
                <cfqueryparam value="#arguments.new_typeid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.catid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertItemCatXrefUser: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELitemcatxref_user" access="public" returntype="query">
    <cfargument name="select_userid" type="numeric" required="true">
    <cfargument name="new_typeid" type="numeric" required="true">
    <cfargument name="new_catid" type="numeric" required="true">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM itemcatxref_user
            WHERE userid = <cfqueryparam value="#arguments.select_userid#" cfsqltype="CF_SQL_INTEGER">
            AND typeid = <cfqueryparam value="#arguments.new_typeid#" cfsqltype="CF_SQL_INTEGER">
            AND catid = <cfqueryparam value="#arguments.new_catid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" text="Error in getItemCatXrefUser: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="INSitemcatxref_user_24468" access="public" returntype="void" output="false">
    <cfargument name="new_typeid" type="numeric" required="true">
    <cfargument name="new_catid" type="numeric" required="true">
    <cfargument name="select_userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO itemcatxref_user (typeid, catid, userid)
            VALUES (
                <cfqueryparam value="#arguments.new_typeid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.new_catid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.select_userid#" cfsqltype="CF_SQL_INTEGER">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in insertItemCatXrefUser: #cfcatch.message# Query: INSERT INTO itemcatxref_user (typeid, catid, userid) VALUES (#arguments.new_typeid#, #arguments.new_catid#, #arguments.select_userid#)" type="error">
            <cfthrow message="Database error occurred while inserting into itemcatxref_user." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
