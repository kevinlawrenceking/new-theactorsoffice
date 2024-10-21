<cfcomponent displayname="UserService" hint="Handles operations for User table" output="false" > 
<cffunction name="gettaousers" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="userID">
    <cfset var sql = "SELECT userID, contactid, defRows, customerid, viewtypeid, dateFormatID, region_id, userFirstName, userLastName, userEmail, userRole, recordname, nletter_link, avatarName, defCountry, defState, tzid, userstatus, recover, userPassword, add1, add2, city, regionid, zip, imdbid, countryid, access_token, refresh_token, datePrefID, IsDeleted, IsBetaTester, isAudition, isAuditionModule, isSetup, nletter_yn, passwordHash, passwordSalt, def_regionid, calStartTime, calEndTime, calSlotDuration FROM taousers_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var validColumns = "userID,userFirstName,userLastName,userEmail,userRole">
    <cfset var queryResult = "">

 
        <cfloop collection="#arguments.filters#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(whereClause, "#key# = ?")>
            </cfif>
        </cfloop>

        <cfif arrayLen(whereClause) gt 0>
            <cfset sql &= " AND " & arrayToList(whereClause," AND ")>
        </cfif>
 
        <cfif listFindNoCase(validColumns, arguments.orderBy)>
            <cfset sql &= " ORDER BY #arguments.orderBy#">
        </cfif>

        <cfquery name="queryResult" datasource="yourDataSource">
            #sql#
            <cfloop collection="#arguments.filters#" item="key">
                <cfif listFindNoCase(validColumns,key)>
                    <cfqueryparam value="#arguments.filters[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.filters[key])#">
                </cfif>
            </cfloop>
        </cfquery>
 
        <cfset queryResult = queryNew("userID,userFirstName,userLastName,userEmail,userRole","integer,varchar,varchar,varchar,varchar")>
 
    <cfreturn queryResult>
</cffunction> 


  
<cffunction name="getUserById" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfset var queryResult = "">

 
 
        <cfquery name="queryResult" >
            SELECT userID, contactid, defRows, customerid, viewtypeid, dateFormatID, 
            region_id,userFirstName, userLastName, userEmail, userRole, 
            nletter_link, avatarName, defCountry, defState, tzid, userstatus, 
            recover, userPassword, add1, add2, city, regionid,
            zip, imdbid, countryid, access_token, refresh_token, datePrefID, 
            IsDeleted, IsBetaTester, isAudition, isAuditionModule, isSetup, nletter_yn, 
            passwordHash, passwordSalt, def_regionid, calStartTime, calEndTime, calSlotDuration
            FROM taousers_tbl
            WHERE userID = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

    <cfset queryResult = queryNew(
    "userID,    contactid",
    "integer,   integer")>
 
    <cfreturn queryResult>
</cffunction>


    <cffunction name="getUser" access="remote" returntype="struct" httpmethod="GET" output="false">
        <cfargument name="userId" type="numeric" required="true">

        <cfset var user = variables.userService.getUserById(arguments.userId)>
        <cfif structIsEmpty(user)>
            <cfreturn {
                "success": false,
                "message": "User not found"
            }>
        <cfelse>
            <cfreturn {
                "success": true,
                "data": user
            }>
        </cfif>
    </cffunction>

<cffunction name="updatetaousers" access="public" returntype="boolean">
    <cfargument name="userID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    <cfset var sql = "UPDATE taousers_tbl SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "userFirstName,userLastName,userEmail,userRole,recordname,nletter_link,avatarName,defCountry,defState,tzid,userstatus,recover,userPassword,add1,add2,city,regionid,zip,imdbid,countryid,access_token,refresh_token,datePrefID,IsDeleted,IsBetaTester,isAudition,isAuditionModule,isSetup,nletter_yn,passwordHash,passwordSalt,def_regionid,calStartTime,calEndTime,calSlotDuration">
    <cfset var result = false>
 
        <cfloop collection="#arguments.data#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(setClauses, "#key# = ?")>
            </cfif>
        </cfloop>

        <cfif arrayLen(setClauses) GT 0>
            <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE userID = ?">

            <cfquery datasource="#DSN#">
                #sql#
                <cfloop collection="#arguments.data#" item="key">
                    <cfif listFindNoCase(validColumns, key)>
                        <cfqueryparam value="#arguments.data[key]#" cfsqltype="#getColumnType(key)#" null="#isNull(arguments.data[key])#">
                    </cfif>
                </cfloop>
                <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>

            <cfset result = true>
        </cfif>
 

    <cfreturn result>
</cffunction> 
 
<cffunction name="getvm_taousers_tickets_shares_timezones" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="">
    <cfargument name="orderDirection" type="string" required="false" default="ASC">
    
    <cfset var validColumns = "userid,contactid,defRows,customerid,ticketid,shared_userid,recordname,userFirstName,userLastName,userEmail,userRole,defCountry,defState,avatarname,tzid,tzname,tickettype,teststatus,rejectnotes,IsBetaTester,calstarttime,calendtime">
    <cfset var sql = "SELECT userid, contactid, defRows, customerid, ticketid, shared_userid, recordname, userFirstName, userLastName, userEmail, userRole, defCountry, defState, avatarname, tzid, tzname, tickettype, teststatus, rejectnotes, IsBetaTester, calstarttime, calendtime FROM vm_taousers_tickets_shares_timezones WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var orderByClause = "">
    <cfset var result = "">

 
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams,
                {value=arguments.filters[key], cfsqltype=structKeyExists(arguments.filters[key], "cfsqltype") ? arguments.filters[key].cfsqltype : "CF_SQL_VARCHAR", null=isNull(arguments.filters[key])}
            )>
        </cfif>
    </cfloop>
 
    <cfif len(trim(arguments.orderBy)) AND listFindNoCase(validColumns, arguments.orderBy)>
        <cfset orderByClause = " ORDER BY #arguments.orderBy# #arguments.orderDirection#">
    </cfif>
 
    <cfset sql = sql & (arrayLen(whereClause) ? " AND " & arrayToList(whereClause," AND ") : "") & orderByClause>
 
 
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#param.null#">
            </cfloop>
        </cfquery>
    
 
    <cfreturn result>
</cffunction></cfcomponent>