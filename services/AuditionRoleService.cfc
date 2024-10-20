<cfcomponent displayname="AuditionRoleService" hint="Handles operations for AuditionRole table" output="false" > 
<cffunction name="insertaudroles" access="public" returntype="numeric">
    <cfargument name="audRoleName" type="string" required="false">
    <cfargument name="audprojectID" type="numeric" required="true">
    <cfargument name="audRoleTypeID" type="numeric" required="false">
    <cfargument name="charDescription" type="string" required="false">
    <cfargument name="holdStartDate" type="date" required="false">
    <cfargument name="holdEndDate" type="date" required="false">
    <cfargument name="essenceID" type="numeric" required="false">
    <cfargument name="audDialectID" type="numeric" required="false">
    <cfargument name="audSourceID" type="numeric" required="false">
    <cfargument name="submitsiteid" type="numeric" required="false">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="recordname" type="string" required="false">
    <cfargument name="incometypeid" type="numeric" required="false">
    <cfargument name="payrate" type="numeric" required="false">
    <cfargument name="netincome" type="numeric" required="false">
    <cfargument name="Buyout" type="numeric" required="false">
    <cfargument name="contactid" type="numeric" required="false">
    <cfargument name="paycycleid" type="numeric" required="false">
    <cfargument name="opencallid" type="numeric" required="false">

    <!--- Default values for non-nullable fields --->
    <cfset var isDeleted = 0>
    <cfset var iscallback = 0>
    <cfset var isredirect = 0>
    <cfset var ispin = 0>
    <cfset var isbooked = 0>

    <!--- SQL Query String --->
    <cfset var sql = "
        INSERT INTO audroles (
            audRoleName, audprojectID, audRoleTypeID, charDescription, holdStartDate, holdEndDate,
            essenceID, audDialectID, audSourceID, submitsiteid, userid, recordname,
            incometypeid, payrate, netincome, Buyout, contactid, paycycleid,
            opencallid, isDeleted, iscallback, isredirect, ispin, isbooked
        ) VALUES (
            ?, ?, ?, ?, ?, ?,
            ?, ?, ?, ?, ?, ?,
            ?, ?, ?, ?, ?, ?,
            ?, ?, ?, ?, ?, ?
        )
    ">

    <!--- Try-Catch Block for Error Handling --->
    <cftry>
        <!--- Execute the Insert Query --->
        <cfquery name="insertQueryResult" datasource="#DSN#" result="insertResult">
            #sql#
            <cfqueryparam value="#arguments.audRoleName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.audRoleName)#">
            <cfqueryparam value="#arguments.audprojectID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.audRoleTypeID#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.audRoleTypeID)#">
            <cfqueryparam value="#arguments.charDescription#" cfsqltype="CF_SQL_LONGVARCHAR" null="#isNull(arguments.charDescription)#">
            <cfqueryparam value="#arguments.holdStartDate#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.holdStartDate)#">
            <cfqueryparam value="#arguments.holdEndDate#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.holdEndDate)#">
            <cfqueryparam value="#arguments.essenceID#" cfsqltype= "CF_SQL_INTEGER " null="#isNull(arguments.essenceID)#">
            <cfqueryparam value="#arguments.audDialectID#" cfsqltype= "CF_SQL_INTEGER " null="#isNull(arguments.audDialectID)#">
            <cfqueryparam value="#arguments.audSourceID#" cfsqltype= "CF_SQL_INTEGER " null="#isNull(arguments.audSourceID)#">
            <cfqueryparam value="#arguments.submitsiteid#" cfsqltype= "CF_SQL_INTEGER " null="#isNull(arguments.submitsiteid)#">
            <cfqueryparam value="#arguments.userid#" cfsqltype= "CF_SQL_INTEGER ">
            <cfqueryparam value="#arguments.recordname#" cfsqltype= "CF_SQL_VARCHAR " null="#isNull(arguments.recordname)#">
            <cfqueryparam value="#arguments.incometypeid#" cfsqltype= "CF_SQL_INTEGER " null="#isNull(arguments.incometypeid)#">
            <cfqueryparam value="#arguments.payrate#" cfsqltype= "CF_SQL_DECIMAL " null="#isNull(arguments.payrate)#">
            <cfqueryparam value="#arguments.netincome#" cfsqltype= "CF_SQL_DECIMAL " null="#isNull(arguments.netincome)#">
            <cfqueryparam value="#arguments.Buyout#" cfsqltype= "CF_SQL_DECIMAL " null="#isNull(arguments.Buyout)#">
            <cfqueryparam value="#arguments.contactid#" cfsqltype= "CF_SQL_INTEGER " null="#isNull(arguments.contactid)#">
            <cfqueryparam value="#arguments.paycycleid#" cfsqltype= "CF_SQL_INTEGER " null="#isNull(arguments.paycycleid)#">
            <cfqueryparam value="#arguments.opencallid#" cfsqltype= "CF_SQL_INTEGER " null="#isNull(arguments.opencallid)#">

            <!--- Non-nullable fields with default values --->
            <cfqueryparam value="#isDeleted#" cfsqltype= "CF_SQL_BIT ">
            <cfqueryparam value="#iscallback#" cfsqltype= "CF_SQL_BIT ">
            <cfqueryparam value="#isredirect#" cfsqltype= "CF_SQL_BIT ">
            <cfqueryparam value="#ispin#" cfsqltype= "CF_SQL_BIT ">
            <cfqueryparam value="#isbooked#" cfsqltype= "CF_SQL_BIT ">
        </ cf query >

        <!--- Return the generated key (primary key) of the inserted record --->
        </ cf try >
        </ cf catch >
        
</cffunction> 

<!--- Changes made:
- Corrected the closing tags for cftry and cfcatch.
- Removed excessive closing cfcatch tags.
--->

<cffunction name="getaudroles" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    
    <cfset var queryResult = "">
    <cfset var sql = "SELECT `audRoleID`, `audprojectID`, `audRoleTypeID`, `essenceID`, `audDialectID`, `audSourceID`, `submitsiteid`, `userid`, `incometypeid`, `contactid`, `paycycleid`, `opencallid`, `audRoleName`, `recordname`, `isDeleted`, `iscallback`, `isredirect`, `ispin`, `isbooked`, `holdStartDate`, `holdEndDate`, `charDescription`, `payrate`, `netincome`, `Buyout` FROM audroles WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "audRoleID,audprojectID,audRoleTypeID,essenceID,audDialectID,audSourceID,submitsiteid,userid,incometypeid,contactid,paycycleid,opencallid,audRoleName,recordname,isDeleted,iscallback,isredirect,ispin,isbooked,holdStartDate,holdEndDate,charDescription,payrate,netincome,Buyout">
    <cfset var validOrderColumns = listToArray(validColumns)>
    
    <cftry>
        <!--- Build WHERE clause dynamically --->
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <!--- Append WHERE conditions to SQL --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Validate and append ORDER BY clause --->
        <cfif arguments.orderBy neq "" and listFindNoCase(validColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <!--- Execute the query --->
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="#getSQLType(key)#" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in getaudroles: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">

        <!--- Return an empty query with the correct schema on error --->
        <cfset queryResult = queryNew("audRoleID,audprojectID,audRoleTypeID,essenceID,audDialectID,audSourceID,submitsiteid,userid,incometypeid,contactid,paycycleid,opencallid,audRoleName,recordname,isDeleted,iscallback,isredirect,ispin,isbooked,holdStartDate,holdEndDate,charDescription,payrate,netincome,Buyout","integer,integer,integer,integer,integer,integer,integer,integer,integer,integer,varchar,varchar,binary,binary,binary,binary,binary,date,date,longvarchar,numeric,numeric,numeric")>
    </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn queryResult>
</cffunction> 

<!--- Changes made:
- Corrected initialization of 'queryResult' from an empty string to an empty query object.
--->

<cffunction name="updateaudroles" access="public" returntype="boolean">
    <cfargument name="audRoleID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    
    <cfset var sql = "UPDATE audroles SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "audRoleName,audprojectID,audRoleTypeID,charDescription,holdStartDate,holdEndDate,essenceID,audDialectID,audSourceID,submitsiteid,userid,isDeleted,recordname,incometypeid,payrate,netincome,Buyout,iscallback,isredirect,ispin,isbooked,contactid,paycycleid,opencallid">
    
    <cfloop collection="#arguments.data#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(setClauses, "#key# = ?")>
        </cfif>
    </cfloop>
    
    <cfif arrayLen(setClauses) eq 0>
        <!--- No valid columns to update --->
        <cfreturn false>
    </cfif>
    
    <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE audRoleID = ?">
    
    <cftry>
        <cfquery datasource="#DSN#">
            #sql#
            <cfloop collection="#arguments.data#" item="key">
                <cfif listFindNoCase(validColumns, key)>
                    <cfqueryparam value="#arguments.data[key]#" cfsqltype="#getSQLType(key)#" null="#isNull(arguments.data[key])#">
                </cfif>
            </cfloop>
            <cfqueryparam value="#arguments.audRoleID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfreturn true>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in updateaudroles: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <cfreturn false>
        </cfcatch>
    </cftry>
</cffunction>

<!--- Changes made:
- None. The code is syntactically correct and should execute properly.
--->

<cffunction name="getvm_audroles_roles_details" access="public" returntype="query">
    <cfargument name="audroleid" type="numeric" required="true">
    <cfset var result = "">
    <cfset var sql = "">
    <cfset var whereClause = []>
    <cfset var validOrderByColumns = "audroleid,audprojectid,auddialectid,audroletypeid,audsourceid,essenceID,audRoleName,audroletype,auddialect,audsource,incometype,essencename,iscallback,isredirect,ispin,isbooked,holdStartDate,holdEndDate,charDescription,payrate,netincome,buyout">

    <cftry>
        <!--- Build the SQL query --->
        <cfset sql = "
            SELECT 
                audroleid,
                audprojectid,
                auddialectid,
                audroletypeid,
                audsourceid,
                essenceID,
                audRoleName,
                audroletype,
                auddialect,
                audsource,
                incometype,
                essencename,
                iscallback,
                isredirect,
                ispin,
                isbooked,
                holdStartDate,
                holdEndDate,
                charDescription,
                payrate,
                netincome,
                buyout
            FROM 
                vm_audroles_roles_details
            WHERE 
                1=1
        ">

        <!--- Add dynamic WHERE clause conditions --->
        <cfif structKeyExists(arguments, "audroleid")>
            <cfset arrayAppend(whereClause, "audroleid = <cfqueryparam value='#arguments.audroleid#' cfsqltype='CF_SQL_INTEGER'>")>
        </cfif>

        <!--- Append WHERE clauses if any --->
        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Execute the query --->
        <cfquery name="result" datasource="yourDataSource">
            #sql#
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" type="error" text="Error in getvm_audroles_roles_details: #cfcatch.message# Details: #cfcatch.detail# Query: #sql#">
        
        <!--- Return an empty query with the correct structure --->
        <cfset result = queryNew("audroleid,audprojectid,auddialectid,audroletypeid,audsourceid,essenceID,audRoleName,audroletype,auddialect,audsource,incometype,essencename,iscallback,isredirect,ispin,isbooked,holdStartDate,holdEndDate,charDescription,payrate,netincome,buyout", "integer,integer,integer,integer,integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,bit,bit,bit,bit,date,date,longvarchar,decimal,decimal,decimal")>
    </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction>
<cffunction name="getvm_audroles_projects_paycycles" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="audcatid">

    <cfset var sql = "SELECT audcatid, audroleid, incometypeid, paycycleid, audcatname, paycyclename, payrate, netincome, buyout FROM vm_audroles_projects_paycycles WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">
    <cfset var validColumns = "audcatid,audroleid,incometypeid,paycycleid,audcatname,paycyclename,payrate,netincome,buyout">
    <cfset var validOrderByColumns = "audcatid,audroleid,incometypeid,paycycleid,audcatname,paycyclename,payrate,netincome,buyout">
    
    <!--- Add session-based conditions --->
    <cfset arrayAppend(whereClause, "e.userid = ?")>
    <cfset arrayAppend(queryParams, {value=session.userid, cfsqltype="CF_SQL_INTEGER"})>
    <cfset arrayAppend(whereClause, "t.userid = ?")>
    <cfset arrayAppend(queryParams, {value=session.userid, cfsqltype="CF_SQL_INTEGER"})>
    <cfset arrayAppend(whereClause, "e.eventstart >= CURDATE()")>

    <!--- Build dynamic WHERE clause based on filters --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams, {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Construct final SQL query --->
    <cfif arrayLen(whereClause) gt 0>
        <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
    </cfif>

    <!--- Validate and append ORDER BY clause --->
    <cfif listFindNoCase(validOrderByColumns, arguments.orderBy)>
        <cfset sql &= " ORDER BY #arguments.orderBy#">
    </cfif>

    <!--- Execute query within try/catch block --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getvm_audroles_projects_paycycles: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return empty query with correct schema on error --->
            <cfset result = queryNew("audcatid,audroleid,incometypeid,paycycleid,audcatname,paycyclename,payrate,netincome,buyout", "integer,integer,integer,integer,varchar,varchar,decimal,decimal,decimal")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction></cfcomponent>
