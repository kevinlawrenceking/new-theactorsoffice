<cfcomponent displayname="ItemCategoryService" hint="Handles operations for ItemCategory table" output="false"> 
<cffunction name="getItemCategories" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    
    <cfset var queryResult = "">
    <cfset var sql = "SELECT * FROM itemcategory">
    <cfset var whereClause = "">
    <cfset var params = []>
    
    <!--- Build WHERE clause dynamically based on arguments --->
    <cfif structCount(arguments.conditions) gt 0>
        <cfset whereClause = " WHERE ">
        <cfloop collection="#arguments.conditions#" item="columnName">
            <cfif listFind("validColumn1,validColumn2,validColumn3", columnName)>
                <cfset whereClause &= "#columnName# = ? AND ">
                <cfset arrayAppend(params, {value=arguments.conditions[columnName], cfsqltype=determineCFSQLType(columnName)})>
            </cfif>
        </cfloop>
        <!--- Remove trailing AND --->
        <cfset whereClause = left(whereClause, len(whereClause) - 5)>
    </cfif>

    <!--- Construct final SQL statement --->
    <cfset sql &= whereClause>

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="yourDataSource">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing query: #sql#. Error: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction>
<cffunction name="getItemCategoryByCatId" access="public" returntype="query">
    <cfargument name="catid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM itemcategory 
            WHERE catid = <cfqueryparam value="#arguments.catid#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getItemCategoryByCatId: #cfcatch.message#; Query: SELECT * FROM itemcategory WHERE catid = ?; Parameters: #arguments.catid#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getDistinctValueTypes" access="public" returntype="query">
    <cfargument name="new_catid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT DISTINCT i.valuetype 
            FROM itemcategory c 
            INNER JOIN itemcatxref_user x ON x.catid = c.catid 
            INNER JOIN itemtypes_user i ON i.typeid = x.typeid 
            WHERE x.catid = <cfqueryparam value="#arguments.new_catid#" cfsqltype="cf_sql_integer"> 
            AND i.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer"> 
            AND x.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer"> 
            ORDER BY valuetype
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDistinctValueTypes: #cfcatch.message#">
            <cfreturn queryNew("valuetype", "varchar")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getDistinctCategoriesAndValueTypes" access="public" returntype="query">
    <cfargument name="catidList" type="array" required="false" default="#ArrayNew(1)#">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT DISTINCT c.catid, i.valuetype
            FROM itemcategory c
            INNER JOIN itemcatxref x ON x.catid = c.catid
            INNER JOIN itemtypes i ON i.typeid = x.typeid
            WHERE 1=1
            <cfif ArrayLen(arguments.catidList) GT 0>
                AND c.catid IN (
                    <cfloop from="1" to="#ArrayLen(arguments.catidList)#" index="i">
                        <cfqueryparam value="#arguments.catidList[i]#" cfsqltype="CF_SQL_INTEGER">
                        <cfif i LT ArrayLen(arguments.catidList)>,</cfif>
                    </cfloop>
                )
            </cfif>
            ORDER BY c.catid, i.valuetype
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDistinctCategoriesAndValueTypes: #cfcatch.message#">
            <cfreturn queryNew("catid, valuetype", "integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getItemCategories" access="public" returntype="query">
    <cfargument name="catArea_UCB" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                i.catID, 
                i.valuecategory, 
                i.catIcon, 
                i.catOrder, 
                i.valuetypedef, 
                i.catSelectList, 
                i.catFieldSet 
            FROM 
                itemcategory i 
            WHERE 
                i.catArea_UCB IN ('B', <cfqueryparam value="#arguments.catArea_UCB#" cfsqltype="CF_SQL_VARCHAR">) 
            ORDER BY 
                catOrder
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getItemCategories: #cfcatch.message#">
            <cfset result = queryNew("catID,valuecategory,catIcon,catOrder,valuetypedef,catSelectList,catFieldSet")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getDistinctValueTypes" access="public" returntype="query">
    <cfargument name="new_catid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT DISTINCT i.valuetype
            FROM itemcategory c
            INNER JOIN itemcatxref_user x ON x.catid = c.catid
            INNER JOIN itemtypes_user i ON i.typeid = x.typeid
            WHERE x.catid = <cfqueryparam value="#arguments.new_catid#" cfsqltype="CF_SQL_INTEGER">
            AND i.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND x.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY valuetype
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDistinctValueTypes: #cfcatch.message#">
            <cfthrow message="An error occurred while fetching distinct value types." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
