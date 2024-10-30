<cfcomponent displayname="AuditionCategoryService" hint="Handles operations for AuditionCategory table" output="false"> 
<cffunction name="SELaudcategories" access="public" returntype="query">
    <cfargument name="new_audsubcatid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                c.audcatid, 
                c.audcatname, 
                s.audsubcatid, 
                s.audsubcatname 
            FROM 
                audcategories c 
            INNER JOIN 
                audsubcategories s ON s.audcatid = c.audcatid 
            WHERE 
                s.audsubcatid = <cfqueryparam value="#arguments.new_audsubcatid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudCategoryDetails: #cfcatch.message#">
            <cfset result = queryNew("audcatid,audcatname,audsubcatid,audsubcatname", "integer,varchar,integer,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELaudcategories_23908" access="public" returntype="query">
    <cfargument name="audcatid" type="numeric" required="false">
    
    <cfset var result = "">
    <cfset var sql = "SELECT s.audsubcatid AS ID, CONCAT(c.audcatname, ' - ', s.audsubcatname) AS NAME FROM audcategories c INNER JOIN audsubcategories s ON s.audcatid = c.audcatid">
    <cfset var whereClause = "">
    <cfset var params = []>
    
    <!--- Build WHERE clause dynamically if parameters are provided --->
    <cfif structKeyExists(arguments, "audcatid")>
        <cfset whereClause = " WHERE s.audcatid = ?">
        <cfset arrayAppend(params, {value=arguments.audcatid, cfsqltype="CF_SQL_INTEGER"})>
    </cfif>
    
    <!--- Complete SQL query with ORDER BY clause --->
    <cfset sql = sql & whereClause & " ORDER BY c.audcatname, s.audsubcatname">

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#params#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing getAudSubcategories: #cfcatch.message# Query: #sql# Parameters: #serializeJSON(params)#">
            <!--- Return an empty query on error --->
            <cfset result = queryNew("ID,NAME", "integer,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELaudcategories_24033" access="public" returntype="query">
    <cfargument name="isDeleted" type="boolean" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT audcatid, audcatname
            FROM audcategories
            WHERE isdeleted = <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            ORDER BY audcatname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getAudCategories: #cfcatch.message# Query: SELECT audcatid, audcatname FROM audcategories WHERE isdeleted = ? ORDER BY audcatname Parameters: #arguments.isDeleted#">
            <cfset result = queryNew("audcatid,audcatname", "integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELaudcategories_24357" access="public" returntype="query">
    <cfargument name="audcatname" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT audcatid 
            FROM audcategories 
            WHERE audcatname = <cfqueryparam value="#arguments.audcatname#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getAudCategoryID: #cfcatch.message# Query: SELECT audcatid FROM audcategories WHERE audcatname = ? Parameters: #arguments.audcatname#">
            <cfthrow message="An error occurred while retrieving the category ID.">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELaudcategories_24367" access="public" returntype="query">
    <cfargument name="audcatname" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT s.audsubcatid 
            FROM audcategories c 
            INNER JOIN audsubcategories s ON s.audcatid = c.audcatid 
            WHERE c.isdeleted = 0 
            AND s.isdeleted = 0 
            AND CONCAT(c.audcatname, "-", s.audSubCatName) = <cfqueryparam value="#arguments.audcatname#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getAudSubCatId: #cfcatch.message# Query: SELECT s.audsubcatid FROM audcategories c INNER JOIN audsubcategories s ON s.audcatid = c.audcatid WHERE c.isdeleted = 0 AND s.isdeleted = 0 AND CONCAT(c.audcatname, '-', s.audSubCatName) = '#arguments.audcatname#'" />
            <cfset result = queryNew("audsubcatid", "integer")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELaudcategories_24368" access="public" returntype="query">
    <cfargument name="audcatname" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT *
            FROM audcategories
            WHERE audcatname = <cfqueryparam value="#arguments.audcatname#" cfsqltype="CF_SQL_VARCHAR">
            AND isdeleted = <cfqueryparam value="0" cfsqltype="CF_SQL_BIT">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudCategories: #cfcatch.message# Query: SELECT * FROM audcategories WHERE audcatname = ? AND isdeleted IS FALSE Parameters: #arguments.audcatname#">
            <cfthrow message="An error occurred while retrieving categories." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELaudcategories_24375" access="public" returntype="query">
    <cfargument name="audsubcatid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                ac.audcatname AS category, 
                aisc.audsubcatname AS subcategory 
            FROM 
                audcategories ac 
            INNER JOIN 
                audsubcategories aisc 
            ON 
                ac.audcatid = aisc.audcatid 
            WHERE 
                aisc.audsubcatid = <cfqueryparam value="#arguments.audsubcatid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getCategoryAndSubcategory: #cfcatch.message#">
            <cfset result = QueryNew("category, subcategory")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELaudcategories_24389" access="public" returntype="query">
    <cfargument name="audcatname" type="string" required="true">
    <cfargument name="audsubcatname" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT s.audsubcatid AS new_audsubcatid
            FROM audcategories c
            INNER JOIN audsubcategories s ON s.audcatid = c.audcatid
            WHERE c.audcatname = <cfqueryparam value="#arguments.audcatname#" cfsqltype="CF_SQL_VARCHAR">
            AND s.audsubcatname = <cfqueryparam value="#arguments.audsubcatname#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getNewAudSubCatId: #cfcatch.message# Query: SELECT s.audsubcatid AS new_audsubcatid FROM audcategories c INNER JOIN audsubcategories s ON s.audcatid = c.audcatid WHERE c.audcatname = ? AND s.audsubcatname = ? Parameters: #arguments.audcatname#, #arguments.audsubcatname#">
            <cfthrow message="An error occurred while retrieving the data. Please check the logs for more details." type="DatabaseQueryError">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INSaudcategories" access="public" returntype="void">
    <cfargument name="new_audCatName" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">

    <cftry>
        <cfquery datasource="abod">
            INSERT INTO audcategories (audCatName, isDeleted)
            VALUES (
                <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audCatName#" maxlength="100" null="#NOT len(trim(arguments.new_audCatName))#">,
                <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertAudCategory: #cfcatch.message#">
            <cfthrow message="An error occurred while inserting the category." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDaudcategories" access="public" returntype="void">
    <cfargument name="new_audCatName" type="string" required="true">
    <cfargument name="new_isDeleted" type="boolean" required="true">
    <cfargument name="new_audCatId" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE audcategories
            SET 
                audCatName = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.new_audCatName#" maxlength="100" null="#NOT len(trim(arguments.new_audCatName))#">,
                isDeleted = <cfqueryparam cfsqltype="CF_SQL_BIT" value="#arguments.new_isDeleted#" null="#NOT len(trim(arguments.new_isDeleted))#">
            WHERE 
                audCatId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.new_audCatId#">
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error updating audcategories: #cfcatch.message#" type="error">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELaudcategories_24735" access="public" returntype="query">
    <cfargument name="isDeleted" type="boolean" required="false" default=false>

    <cfset var result = "" />
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT audcatid, audcatname
            FROM audcategories
            WHERE isdeleted = <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            ORDER BY audcatname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getAudCategories: #cfcatch.message#" />
            <cflog file="application" text="Query: SELECT audcatid, audcatname FROM audcategories WHERE isdeleted = #arguments.isDeleted# ORDER BY audcatname" />
            <cflog file="application" text="Error Detail: #cfcatch.detail#" />
            <cfset result = queryNew("audcatid,audcatname")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELaudcategories_24744" access="public" returntype="query">
    <cfargument name="isDeleted" type="boolean" required="true">
    
    <cfset var result = "">
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT a.audcatid, a.audcatname
            FROM audcategories a
            WHERE a.isDeleted = <cfqueryparam value="#arguments.isDeleted#" cfsqltype="CF_SQL_BIT">
            ORDER BY a.audcatname
        </cfquery>
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getActiveAudCategories: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction></cfcomponent>
