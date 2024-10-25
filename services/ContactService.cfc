<cfcomponent displayname="ContactService" hint="Handles operations for Contact table" output="false" > 
<cffunction name="insertcontactdetails" access="public" returntype="numeric">
    <cfargument name="data" type="struct" required="true">
    <cfset var sql = "INSERT INTO contactdetails_tbl (
        contactID, refer_contact_id, userID, contactTitle, contactFullName, 
        contactFirst, contactMiddle, contactLast, contactSuffix, contactNickname, 
        contactPhoto, contactShortName, contactMaidenName, contactMeetingLoc, 
        contactStatus, contactNotes, contactPronoun, imdbid, recordname, IsDeleted,
        contactCreationDate, contactLastUpdated, contactBirthday, contactMeetingDate,
        dateAdded, user_yn, birthday_DD, birthday_MM, newsletter_yn,
        googlealert_yn, socialmedia_yn, avatar_yn
    ) VALUES (
        ?, ?, ?, ?, ?, 
        ?, ?, ?, ?, ?, 
        ?, ?, ?, ?, 
        ?, ?, ?, ?, ?, ?,
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, ?, ?,
        ?, ?, ?, ?, ?,
        ?, ?, ?
    )">
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="insertResult">
            #sql#
            <cfqueryparam value="#arguments.data.contactID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.data.refer_contact_id#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.refer_contact_id)#">
            <cfqueryparam value="#arguments.data.userID#" cfsqltype="CF_SQL_INTEGER">
            <cfqueryparam value="#arguments.data.contactTitle#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactTitle)#">
            <cfqueryparam value="#arguments.data.contactFullName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactFullName)#">
            <cfqueryparam value="#arguments.data.contactFirst#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactFirst)#">
            <cfqueryparam value="#arguments.data.contactMiddle#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactMiddle)#">
            <cfqueryparam value="#arguments.data.contactLast#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactLast)#">
            <cfqueryparam value="#arguments.data.contactSuffix#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactSuffix)#">
            <cfqueryparam value="#arguments.data.contactNickname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactNickname)#">
            <cfqueryparam value="#arguments.data.contactPhoto#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactPhoto)#">
            <cfqueryparam value="#arguments.data.contactShortName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactShortName)#">
            <cfqueryparam value="#arguments.data.contactMaidenName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactMaidenName)#">
            <cfqueryparam value="#arguments.data.contactMeetingLoc#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactMeetingLoc)#">
            <cfqueryparam value="#arguments.data.contactStatus#" cfsqltype="CF_SQL_VARCHAR">
            <cfqueryparam value="#arguments.data.contactNotes#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactNotes)#">
            <cfqueryparam value="#arguments.data.contactPronoun#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.contactPronoun)#">
            <cfqueryparam value="#arguments.data.imdbid#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.imdbid)#">
            <cfqueryparam value="#arguments.data.recordname#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.recordname)#">
            <cfqueryparam value="#arguments.data.IsDeleted#" cfsqltype="CF_SQL_BIT">

            <!--- Timestamps are set to CURRENT_TIMESTAMP by default --->
            
            <cfqueryparam value="#arguments.data.contactBirthday#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.data.contactBirthday)#">
            <cfqueryparam value="#arguments.data.contactMeetingDate#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.data.contactMeetingDate)#">
            
            <!--- Date fields --->
            
            <cfqueryparam value="#arguments.data.dateAdded#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.data.dateAdded)#">

            <!--- Char fields --->
            
            <cfqueryparam value="#arguments.data.user_yn#" cfsqltype="CF_SQL_CHAR">
            <cfqueryparam value="#arguments.data.birthday_DD#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.data.birthday_DD)#">
            <cfqueryparam value="#arguments.data.birthday_MM#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.data.birthday_MM)#">
            
            <!--- Newsletter and alert flags --->
            
            <cfqueryparam value="#arguments.data.newsletter_yn#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.data.newsletter_yn)#">
            <cfqueryparam value="#arguments.data.googlealert_yn#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.data.googlealert_yn)#">
            <cfqueryparam value="#arguments.data.socialmedia_yn#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.data.socialmedia_yn)#">
            
            <!--- Avatar flag --->
            
            <cfqueryparam value="#arguments.data.avatar_yn#" cfsqltype="CF_SQL_CHAR" null="#isNull(arguments.data.avatar_yn)#">

        </cfquery>
        <!--- Return the generated key (usually the primary key) --->
        <cfreturn insertResult.generatedKey>
    <cfcatch type="any">
        <!--- Log the error details --->
        <cflog file="application" text="Error inserting into contactdetails_tbl: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#"/>
        
        <!--- Return 0 or a negative number to indicate failure --->
        <cfreturn 0>
    </cfcatch>
    </cftry>
</cffunction>

<!--- Changes made:
- Added missing closing tag for cfargument.
--->

<cffunction name="getcontactdetails" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="contactID">
    <cfargument name="orderDirection" type="string" required="false" default="ASC">

    <cfset var validColumns = "contactID, refer_contact_id, userID, contactTitle, contactFullName, contactFirst, contactMiddle, contactLast, contactSuffix, contactNickname, contactPhoto, contactShortName, contactMaidenName, contactMeetingLoc, contactStatus, contactNotes, contactPronoun, imdbid, recordname, IsDeleted, contactCreationDate, contactLastUpdated, contactBirthday, contactMeetingDate, dateAdded, user_yn, birthday_DD, birthday_MM, newsletter_yn, googlealert_yn, socialmedia_yn, avatar_yn">
    <cfset var sql = "SELECT `contactID`, `refer_contact_id`, `userID`, `contactTitle`, `contactFullName`, `contactFirst`, `contactMiddle`, `contactLast`, `contactSuffix`, `contactNickname`, `contactPhoto`, `contactShortName`, `contactMaidenName`, `contactMeetingLoc`, `contactStatus`, `contactNotes`, `contactPronoun`, `imdbid`, `recordname`, `IsDeleted`, `contactCreationDate`, `contactLastUpdated`, `contactBirthday`, `contactMeetingDate`, `dateAdded`, `user_yn`, `birthday_DD`, `birthday_MM`, `newsletter_yn`, `googlealert_yn`, `socialmedia_yn`, `avatar_yn` FROM contactdetails_tbl WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">

    <!--- Validate orderBy column --->
    <cfif NOT listFindNoCase(validColumns, arguments.orderBy)>
        <cfset arguments.orderBy = "contactID">
    </cfif>

    <!--- Validate orderDirection --->
    <cfif NOT listFindNoCase("ASC,DESC", arguments.orderDirection)>
        <cfset arguments.orderDirection = "ASC">
    </cfif>

    <!--- Build WHERE clause dynamically --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause, "#key# = ?")>
            <cfset arrayAppend(queryParams,
                {value=arguments.filters[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Complete SQL statement --->
    <cfif arrayLen(whereClause) GT 0>
        <cfset sql &= " AND " & arrayToList(whereClause," AND ")>
    </cfif>

    <!--- Add ORDER BY clause --->
    <cfset sql &= " ORDER BY #arguments.orderBy# #arguments.orderDirection#">

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getcontactdetails: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
            <!--- Return an empty query with the correct columns on error --->
            <cfset result = queryNew("`contactID`,`refer_contact_id`,`userID`,`contactTitle`,`contactFullName`,`contactFirst`,`contactMiddle`,`contactLast`,`contactSuffix`,`contactNickname`,`contactPhoto`,`contactShortName`,`contactMaidenName`,`contactMeetingLoc`,`contactStatus`,`contactNotes`,`contactPronoun`,`imdbid`,`recordname`,`IsDeleted`,`contactCreationDate`,`contactLastUpdated`,`contactBirthday`,`contactMeetingDate`,`dateAdded`,`user_yn`,`birthday_DD`,`birthday_MM`,`newsletter_yn`,`googlealert_yn`,`socialmedia_yn`,`avatar_yn`", "integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,char,timestamp,timestamp,date,date,date,char,char,char,char,char,char")>
        </cfcatch>
    </cftry>

    <!--- Return the query result --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- Removed the DE() function wrapper from getSQLType(key) in cfset for queryParams as it was incorrect.
--->

<cffunction name="updatecontactdetails" access="public" returntype="boolean">
    <cfargument name="contactID" type="numeric" required="true">
    <cfargument name="data" type="struct" required="true">
    <cfset var sql = "UPDATE contactdetails_tbl SET">
    <cfset var setClauses = []>
    <cfset var validColumns = "contactTitle,contactFullName,contactFirst,contactMiddle,contactLast,contactSuffix,contactNickname,contactPhoto,contactShortName,contactMaidenName,refer_contact_id,contactMeetingLoc,contactStatus,contactNotes,contactPronoun,imdbid,recordname,userID,user_yn,birthday_DD,birthday_MM,newsletter_yn,googlealert_yn,socialmedia_yn,avatar_yn">
    <cfset var result = false>

    <cftry>
        <cfloop collection="#arguments.data#" item="key">
            <cfif listFindNoCase(validColumns, key)>
                <cfset arrayAppend(setClauses, "#key# = ?")>
            </cfif>
        </cfloop>

        <cfif arrayLen(setClauses) gt 0>
            <cfset sql &= " " & arrayToList(setClauses, ", ") & " WHERE contactID = ?">

            <cfquery datasource="#DSN#">
                #sql#
                <cfloop collection="#arguments.data#" item="key">
                    <cfif listFindNoCase(validColumns, key)>
                        <cfqueryparam value="#arguments.data[key]#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data[key])#">
                    </cfif>
                </cfloop>
                <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>

            <cfset result = true>
        </cfif>

        <cflog file="application" text="Update successful for contactID: #arguments.contactID#">
    <cfcatch>
        <cflog file="application" type="error" text="Error updating contact details: #cfcatch.message# - #cfcatch.detail# - SQL: #sql#">
    </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction> 

<!--- Changes made:
- No syntax errors found; the code is correct as provided.
--->


      <cffunction name="getActiveTeamContactsByUserId" access="public" returntype="query">
        <!--- Define the argument for userId --->
        <cfargument name="userId" type="numeric" required="true">
        
        <!--- Declare the local variable scope --->
        <cfset var local = {}>
        
        <!--- Create the query --->
        <cfquery name="local.qTeamContacts" datasource="yourDataSource">
            SELECT 
                d.contactid,
                d.recordname AS contactname,
                d.contactStatus
            FROM 
                contactdetails d
            INNER JOIN 
                taousers u ON u.userid = d.userid
            WHERE 
                u.userid = <cfqueryparam value="#arguments.userId#" cfsqltype="cf_sql_integer">
                AND d.contactStatus = 'Active'
                AND d.contactid IN (
                    SELECT contactid 
                    FROM contactitems 
                    WHERE valuetext = 'My Team'
                    AND valuecategory = 'Tag'
                )
            ORDER BY 
                d.contactfullname
        </cfquery>
        
        <!--- Return the query result --->
        <cfreturn local.qTeamContacts>
    </cffunction>


<cffunction name="getvm_contactdetails_audcontacts" access="public" returntype="query">
    <cfargument name="idlist" type="string" required="true">
    <cfargument name="new_systemid" type="numeric" required="true">
    <cfset var result = "">
    <cfset var sql = "">
    <cfset var whereClause = []>
    <cfset var validColumns = "contactid,audprojectid,contactname,contactfullname,contactStatus">

    <cftry>
        <!--- Construct the SQL query --->
        <cfset sql = "
            SELECT 
                contactid, 
                audprojectid, 
                contactname, 
                contactfullname, 
                contactStatus
            FROM 
                vm_contactdetails_audcontacts
            WHERE 
                isdeleted = 0
        ">

        <!--- Add dynamic conditions --->
        <cfif len(trim(arguments.idlist))>
            <cfset arrayAppend(whereClause, "contactid IN (#arguments.idlist#)")>
        </cfif>

        <cfif isNumeric(arguments.new_systemid)>
            <cfset arrayAppend(whereClause, "systemid = ?")>
        </cfif>

        <!--- Append WHERE clauses if any --->
        <cfif arrayLen(whereClause)>
            <cfset sql &= " AND " & arrayToList(whereClause, " AND ")>
        </cfif>

        <!--- Add ORDER BY clause --->
        <cfset sql &= " ORDER BY contactid">

        <!--- Execute the query --->
        <cfquery name="result" datasource="abod">
            #sql#
            <cfif isNumeric(arguments.new_systemid)>
                <cfqueryparam value="#arguments.new_systemid#" cfsqltype="CF_SQL_INTEGER">
            </cfif>
        </cfquery>

    <cfcatch type="any">
        <!--- Log the error --->
        <cflog file="application" text="Error in getvm_contactdetails_audcontacts: #cfcatch.message# Details: #cfcatch.detail# SQL: #sql#">
        
        <!--- Return an empty query with correct schema --->
        <cfset result = queryNew("contactid,audprojectid,contactname,contactfullname,contactStatus", "integer,integer,varchar,varchar,varchar")>
    </cfcatch>
    </cftry>

    <!--- Return the result --->
    <cfreturn result>
</cffunction></cfcomponent>
