<cfcomponent displayname="UserService" hint="Handles operations for User table" output="false"> 
<cffunction name="getActiveUserTickets" access="public" returntype="query">
    <cfargument name="ticketActive" type="string" required="true">
    
    <cfset var qResult = "">
    
    <cftry>
        <cfquery name="qResult" datasource="abod">
            SELECT DISTINCT 
                u.recordname, 
                u.userrole, 
                u.userid 
            FROM 
                taousers u 
            INNER JOIN 
                tickets t ON u.userID = t.userid 
            WHERE 
                t.ticketactive = <cfqueryparam value="#arguments.ticketActive#" cfsqltype="CF_SQL_CHAR">
            ORDER BY 
                u.userlastname, 
                u.userfirstname
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveUserTickets: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn qResult>
</cffunction>
<cffunction name="getActiveTicketTypes" access="public" returntype="query">
    <cfargument name="ticketActive" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT DISTINCT t.tickettype
            FROM taousers u
            INNER JOIN tickets t ON u.userID = t.userid
            WHERE t.ticketactive = <cfqueryparam value="#arguments.ticketActive#" cfsqltype="CF_SQL_CHAR">
            ORDER BY t.tickettype
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveTicketTypes: #cfcatch.message#">
            <cfset result = queryNew("tickettype")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getTicketTestUsers" access="public" returntype="query">
    <cfargument name="ticketId" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                tu.id, 
                tu.ticketid, 
                tu.userid, 
                u.recordname, 
                tu.teststatus, 
                tu.rejectnotes
            FROM 
                tickettestusers tu
            INNER JOIN 
                taousers u ON u.userid = tu.userid
            WHERE 
                tu.ticketid = <cfqueryparam value="#arguments.ticketId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getTicketTestUsers: #cfcatch.message#" type="error">
            <cfset result = queryNew("id,ticketid,userid,recordname,teststatus,rejectnotes")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="updateUserViewType" access="public" returntype="void">
    <cfargument name="view" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var viewTypeId = 0>
    
    <!--- Determine viewTypeId based on view argument --->
    <cfif arguments.view eq "tbl">
        <cfset viewTypeId = 1>
    <cfelse>
        <cfset viewTypeId = 2>
    </cfif>

    <cftry>
        <!--- Execute the parameterized query --->
        <cfquery datasource="abod">
            UPDATE taousers 
            SET viewtypeid = <cfqueryparam value="#viewTypeId#" cfsqltype="CF_SQL_INTEGER"> 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" type="error" text="Error updating user view type. UserID: #arguments.userid#, Error: #cfcatch.message#">
            <!--- Optionally rethrow or handle the error further --->
            <cfthrow message="An error occurred while updating the user view type." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserDetails" access="public" returntype="query">
    <cfargument name="select_userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                u.userid, 
                u.recordname, 
                u.userFirstName, 
                u.userLastName, 
                u.userEmail, 
                u.contactid, 
                u.userRole 
            FROM 
                taousers u
            <cfif arguments.select_userid neq 0>
                WHERE u.userid = <cfqueryparam value="#arguments.select_userid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserDetails: #cfcatch.message#">
            <cfset result = queryNew("userid,recordname,userFirstName,userLastName,userEmail,contactid,userRole")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="updateUserAccessToken" access="public" returntype="void">
    <cfargument name="accessToken" type="string" required="true">
    <cfargument name="userId" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE taousers 
            SET access_token = <cfqueryparam value="#arguments.accessToken#" cfsqltype="CF_SQL_VARCHAR"> 
            WHERE userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error updating user access token: #cfcatch.message# Query: UPDATE taousers SET access_token = ? WHERE userid = ?">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateUser" access="public" returntype="void">
    <cfargument name="new_userfirstname" type="string" required="true">
    <cfargument name="new_userlastname" type="string" required="true">
    <cfargument name="new_avatarname" type="string" required="true">
    <cfargument name="new_useremail" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE taousers 
            SET userfirstname = <cfqueryparam value="#arguments.new_userfirstname#" cfsqltype="CF_SQL_VARCHAR">,
                userlastname = <cfqueryparam value="#arguments.new_userlastname#" cfsqltype="CF_SQL_VARCHAR">,
                avatarname = <cfqueryparam value="#arguments.new_avatarname#" cfsqltype="CF_SQL_VARCHAR">,
                useremail = <cfqueryparam value="#arguments.new_useremail#" cfsqltype="CF_SQL_VARCHAR">
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error updating user: #cfcatch.message#">
            <cfthrow message="An error occurred while updating the user. Please try again later.">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateUserNewsletter" access="public" returntype="void">
    <cfargument name="new_nletter_link" type="string" required="true">
    <cfargument name="new_nletter_yn" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE taousers 
            SET nletter_link = <cfqueryparam value="#arguments.new_nletter_link#" cfsqltype="CF_SQL_VARCHAR">, 
                nletter_yn = <cfqueryparam value="#arguments.new_nletter_yn#" cfsqltype="CF_SQL_VARCHAR">
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error updating user newsletter: #cfcatch.message# Query: #cfcatch.query#">
            <cfthrow message="An error occurred while updating the user newsletter." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateUserDetails" access="public" returntype="void">
    <cfargument name="calstarttime" type="date" required="true">
    <cfargument name="calendtime" type="date" required="true">
    <cfargument name="defRows" type="numeric" required="true">
    <cfargument name="defCountry" type="string" required="true">
    <cfargument name="defState" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE taousers 
            SET 
                calstarttime = <cfqueryparam cfsqltype="cf_sql_time" value="#arguments.calstarttime#" />,
                calendtime = <cfqueryparam cfsqltype="cf_sql_time" value="#arguments.calendtime#" />,
                defRows = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.defRows#" />,
                defCountry = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.defCountry#" />,
                defState = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.defState#" />
            WHERE 
                userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.userid#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating user details: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getContactIdByUserId" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT contactid 
            FROM taousers 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactIdByUserId: #cfcatch.message#">
            <cfset result = queryNew("contactid")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="updateUserTokens" access="public" returntype="void">
    <cfargument name="accesstoken" type="string" required="true">
    <cfargument name="refreshToken" type="string" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE taousers 
            SET access_token = <cfqueryparam value="#arguments.accesstoken#" cfsqltype="CF_SQL_VARCHAR">, 
                refresh_token = <cfqueryparam value="#arguments.refreshToken#" cfsqltype="CF_SQL_VARCHAR"> 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating user tokens: #cfcatch.message#">
            <cfthrow message="An error occurred while updating user tokens." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateUserAccessToken" access="public" returntype="void" hint="Updates the access token for a user based on their userid.">
    <cfargument name="accessToken" type="string" required="true" hint="The new access token to be set.">
    <cfargument name="userid" type="numeric" required="true" hint="The ID of the user whose access token is to be updated.">

    <cftry>
        <cfquery datasource="abod">
            UPDATE taousers 
            SET access_token = <cfqueryparam value="#arguments.accessToken#" cfsqltype="CF_SQL_VARCHAR"> 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch>
            <cflog file="application" type="error" text="Error updating access token for userid #arguments.userid#: #cfcatch.message#">
            <cfthrow message="An error occurred while updating the access token." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserDetails" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                u.userid, 
                u.recordname, 
                u.userFirstName, 
                u.userLastName, 
                u.userEmail, 
                u.contactid, 
                u.userRole, 
                u.IsBetaTester, 
                u.defRows, 
                u.defCountry, 
                u.defState, 
                u.calstarttime, 
                u.calendtime, 
                u.avatarname, 
                u.contactid AS userContactID, 
                u.tzid, 
                t.tzname, 
                u.customerid
            FROM taousers u
            LEFT JOIN timezones t ON t.tzid = u.tzid
            WHERE u.userid = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch>
            <cflog file="application" text="Error in getUserDetails: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="updateUserAvatar" access="public" returntype="void">
    <cfargument name="userFirstName" type="string" required="true">
    <cfargument name="userId" type="numeric" required="true">

    <cftry>
        <cfquery name="updateAvatar" datasource="yourDataSource">
            UPDATE taousers 
            SET avatarname = <cfqueryparam value="#arguments.userFirstName#" cfsqltype="CF_SQL_VARCHAR">
            WHERE userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating user avatar: #cfcatch.message# Query: #cfcatch.query#">
            <cfthrow message="Error updating user avatar." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="updateUserContact" access="public" returntype="void">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cftry>
        <cfquery datasource="abod">
            UPDATE taousers 
            SET contactid = <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating user contact: #cfcatch.message# Query: #cfcatch.query# Parameters: new_contactid=#arguments.new_contactid#, userid=#arguments.userid#">
            <cfthrow message="An error occurred while updating the user contact." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getUserDetails" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                u.userid, 
                u.recordname, 
                u.userFirstName, 
                u.userLastName, 
                u.userEmail, 
                u.contactid, 
                u.userRole, 
                u.calstarttime, 
                u.calendtime, 
                u.avatarname, 
                u.IsBetaTester, 
                u.defRows, 
                u.defCountry, 
                u.defState, 
                u.contactid AS userContactID, 
                u.tzid, 
                t.tzname, 
                u.customerid
            FROM taousers u
            LEFT JOIN timezones t ON t.tzid = u.tzid
            WHERE u.userid = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserDetails: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getUserDetails" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                u.userid AS new_userid, 
                u.recordname AS username 
            FROM 
                taousers u 
            WHERE 
                u.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserDetails: #cfcatch.message# Query: SELECT u.userid AS new_userid, u.recordname AS username FROM taousers u WHERE u.userid = ? Parameters: #arguments.userid#">
            <cfset result = queryNew("new_userid,username", "integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getUserById" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfset var result = "">

    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM taousers 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserById: #cfcatch.message# Query: SELECT * FROM taousers WHERE userid = #arguments.userid#">
            <cfthrow message="An error occurred while retrieving the user." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="getLatestUserId" access="public" returntype="query">
    <cfargument name="conditions" type="struct" required="false" default="#structNew()#">
    
    <cfset var queryResult = "">
    <cfset var sql = "SELECT userid FROM taousers">
    <cfset var whereClauses = []>
    <cfset var paramValues = []>
    
    <!--- Build WHERE clause dynamically based on conditions argument --->
    <cfloop collection="#arguments.conditions#" item="key">
        <cfset arrayAppend(whereClauses, "#key# = ?")>
        <cfset arrayAppend(paramValues, {value=arguments.conditions[key], cfsqltype=determineSQLType(key)})>
    </cfloop>
    
    <!--- Add WHERE clause if there are conditions --->
    <cfif arrayLen(whereClauses) gt 0>
        <cfset sql &= " WHERE " & arrayToList(whereClauses, " AND ")>
    </cfif>

    <!--- Add ORDER BY clause --->
    <cfset sql &= " ORDER BY userid DESC LIMIT 1">

    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="queryResult" datasource="abod">
            #sql#
            <cfloop array="#paramValues#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error executing query: #cfcatch.message# SQL: #sql# Parameters: #serializeJSON(paramValues)#">
            <cfreturn queryNew("userid")> <!--- Return an empty query set --->
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction>
<cffunction name="getUserRecords" access="public" returntype="query">
    <cfargument name="recordName" type="string" required="false">
    
    <cfset var result = "">
    <cfset var sql = "SELECT MIN(u.userid) AS id, u.recordname AS name FROM taousers u">
    <cfset var whereClause = "">
    <cfset var orderByClause = " ORDER BY u.recordname">
    
    <!--- Build WHERE clause dynamically --->
    <cfif structKeyExists(arguments, "recordName") AND len(arguments.recordName)>
        <cfset whereClause = " WHERE u.recordname = ?">
    </cfif>
    
    <!--- Construct final SQL query --->
    <cfset sql = sql & whereClause & " GROUP BY u.recordname" & orderByClause>
    
    <!--- Execute the query with error handling --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfif len(whereClause)>
                <cfqueryparam value="#arguments.recordName#" cfsqltype="CF_SQL_VARCHAR">
            </cfif>
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error executing getUserRecords: #cfcatch.message# Query: #sql# Parameters: #arguments.recordName#">
            <!--- Return an empty query on error --->
            <cfset result = queryNew("id,name", "integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getUsersWithShares" access="public" returntype="query">
    <cfargument name="userIds" type="array" required="true">
    
    <cfset var result = "">
    <cfset var sql = "">
    <cfset var paramList = "">
    
    <cftry>
        <cfif arrayLen(arguments.userIds) eq 0>
            <!--- Return an empty query if no user IDs are provided --->
            <cfquery name="result" datasource="abod">
                SELECT * FROM taousers WHERE 1=0
            </cfquery>
        <cfelse>
            <!--- Construct the SQL query with parameterized inputs --->
            <cfset sql = "SELECT * FROM taousers WHERE userid IN (">
            
            <!--- Loop through userIds to create parameter placeholders --->
            <cfloop index="i" from="1" to="#arrayLen(arguments.userIds)#">
                <cfset sql &= "?">
                <cfif i lt arrayLen(arguments.userIds)>
                    <cfset sql &= ", ">
                </cfif>
                <!--- Append cfqueryparam for each userId --->
                <cfset paramList &= "<cfqueryparam value='#arguments.userIds[i]#' cfsqltype='CF_SQL_INTEGER'>,">
            </cfloop>
            
            <!--- Close the IN clause --->
            <cfset sql &= ")">
            
            <!--- Execute the query --->
            <cfquery name="result" datasource="abod">
                #sql#
                <!--- Dynamically insert cfqueryparam tags --->
                #paramList#
            </cfquery>
        </cfif>
        
        <!--- Return the result query --->
        <cfreturn result>

    <cfcatch type="any">
        <!--- Log the error details --->
        <cflog file="application" text="Error in getUsersWithShares: #cfcatch.message# Query: #sql# Parameters: #arguments.userIds#">
        <!--- Return an empty query on error --->
        <cfquery name="result" datasource="abod">
            SELECT * FROM taousers WHERE 1=0
        </cfquery>
        <cfreturn result>
    </cfcatch>
    </cftry>

</cffunction>
<cffunction name="getUserDetails" access="public" returntype="query">
    <cfargument name="select_userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                users.userid, 
                users.recordname, 
                users.userFirstName, 
                users.userLastName, 
                users.userEmail, 
                users.contactid, 
                users.userRole 
            FROM 
                taousers users
            <cfif arguments.select_userid neq 0>
                WHERE users.userid = <cfqueryparam value="#arguments.select_userid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserDetails: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="getUserById" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT * 
            FROM taousers 
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserById: #cfcatch.message# Query: SELECT * FROM taousers WHERE userid = #arguments.userid#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="getUserByEmail" access="public" returntype="query">
    <cfargument name="userEmail" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                u.userid, 
                u.userFirstName, 
                u.userLastName, 
                u.userEmail, 
                u.userRole
            FROM 
                taousers u
            WHERE 
                u.userEmail = <cfqueryparam value="#arguments.userEmail#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserByEmail: #cfcatch.message# Query: #cfcatch.detail#">
            <cfset result = queryNew("userid,userFirstName,userLastName,userEmail,userRole")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="getUserDetailsByEmail" access="public" returntype="query">
    <cfargument name="userEmail" type="string" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            SELECT 
                u.userid, 
                u.userFirstName, 
                u.userLastName, 
                u.userEmail, 
                u.userRole 
            FROM 
                taousers u 
            WHERE 
                u.userEmail = <cfqueryparam value="#arguments.userEmail#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getUserDetailsByEmail: #cfcatch.message#">
            <cfset result = queryNew("userid,userFirstName,userLastName,userEmail,userRole")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction></cfcomponent>
