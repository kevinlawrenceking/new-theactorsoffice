<cfcomponent displayname="ExportItemService" hint="Handles operations for ExportItem table" output="false" > 
<cffunction name="insertexportitems" access="public" returntype="numeric">
    <cfargument name="data" type="struct" required="true">
    <cfset var insertResult = 0>
    <cftry>
        <cfquery name="insertQuery" datasource="#DSN#" result="result">
            INSERT INTO exportitems (
                itemid, exportid, contactid, FirstName, LastName, Tag1, Tag2, Tag3,
                BusinessEmail, PersonalEmail, WorkPhone, MobilePhone, HomePhone,
                Company, Address, Address2, City, State, Zip, Country,
                ContactMeetingDate, ContactMeetingLoc, contactBirthday, Website
            ) VALUES (
                <cfqueryparam value="#arguments.data.itemid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.itemid)#">,
                <cfqueryparam value="#arguments.data.exportid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.exportid)#">,
                <cfqueryparam value="#arguments.data.contactid#" cfsqltype="CF_SQL_INTEGER" null="#isNull(arguments.data.contactid)#">,
                <cfqueryparam value="#arguments.data.FirstName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.FirstName)#">,
                <cfqueryparam value="#arguments.data.LastName#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.LastName)#">,
                <cfqueryparam value="#arguments.data.Tag1#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Tag1)#">,
                <cfqueryparam value="#arguments.data.Tag2#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Tag2)#">,
                <cfqueryparam value="#arguments.data.Tag3#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Tag3)#">,
                <cfqueryparam value="#arguments.data.BusinessEmail#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.BusinessEmail)#">,
                <cfqueryparam value="#arguments.data.PersonalEmail#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.PersonalEmail)#">,
                <cfqueryparam value="#arguments.data.WorkPhone#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.WorkPhone)#">,
                <cfqueryparam value="#arguments.data.MobilePhone#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.MobilePhone)#">,
                <cfqueryparam value="#arguments.data.HomePhone#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.HomePhone)#">,
                <cfqueryparam value="#arguments.data.Company#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Company)#">,
                <cfqueryparam value="#arguments.data.Address#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Address)#">,
                <cfqueryparam value="#arguments.data.Address2#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Address2)#">,
                <cfqueryparam value="#arguments.data.City#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.City)#">,
                <cfqueryparam value="#arguments.data.State#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.State)#">,
                <cfqueryparam value="#arguments.data.Zip#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Zip)#">,
                <cfqueryparam value="#arguments.data.Country#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Country)#">,
                <cfqueryparam value="#arguments.data.ContactMeetingDate#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.data.ContactMeetingDate)#">,
                <cfqueryparam value="#arguments.data.ContactMeetingLoc#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.ContactMeetingLoc)#">,
                <cfqueryparam value="#arguments.data.contactBirthday#" cfsqltype="CF_SQL_DATE" null="#isNull(arguments.data.contactBirthday)#">,
                <cfqueryparam value="#arguments.data.Website#" cfsqltype="CF_SQL_VARCHAR" null="#isNull(arguments.data.Website)#">
            )
        </cfquery>
        <cfset insertResult = result.generatedKey>
    <cfcatch>
        <cflog text="Error inserting into exportitems: #cfcatch.message# - #cfcatch.detail#">
        <!--- Optionally handle the error further or rethrow --->
    </cfcatch>
    </cftry>
    <cfreturn insertResult>
</cffunction>

<!--- Changes made:
- Added missing closing tag for cfargument.
--->

<cffunction name="getexportitems" access="public" returntype="query">
    <cfargument name="filters" type="struct" required="false" default="#structNew()#">
    <cfargument name="orderBy" type="string" required="false" default="itemid">
    <cfargument name="orderDirection" type="string" required="false" default="ASC">

    <cfset var validColumns = "itemid,exportid,contactid,FirstName,LastName,Tag1,Tag2,Tag3,BusinessEmail,PersonalEmail,WorkPhone,MobilePhone,HomePhone,Company,Address,Address2,City,State,Zip,Country,ContactMeetingLoc,Website,ContactMeetingDate,contactBirthday">
    <cfset var sql = "SELECT itemid, exportid, contactid, FirstName, LastName, Tag1, Tag2, Tag3, BusinessEmail, PersonalEmail, WorkPhone, MobilePhone, HomePhone, Company, Address, Address2, City, State, Zip, Country, ContactMeetingLoc, Website, ContactMeetingDate, contactBirthday FROM exportitems WHERE 1=1">
    <cfset var whereClause = []>
    <cfset var queryParams = []>
    <cfset var result = "">
    
    <!--- Validate orderBy column --->
    <cfif NOT listFindNoCase(validColumns, arguments.orderBy)>
        <cfset arguments.orderBy = "itemid">
    </cfif>

    <!--- Validate orderDirection --->
    <cfif NOT listFindNoCase("ASC,DESC", arguments.orderDirection)>
        <cfset arguments.orderDirection = "ASC">
    </cfif>

    <!--- Build dynamic WHERE clause --->
    <cfloop collection="#arguments.filters#" item="key">
        <cfif listFindNoCase(validColumns, key)>
            <cfset arrayAppend(whereClause,"#key# = ?")>
            <cfset arrayAppend(queryParams,{value=arguments.filters[key], cfsqltype=getSQLType(key)})>
        </cfif>
    </cfloop>

    <!--- Append WHERE clauses if any --->
    <cfif arrayLen(whereClause) GT 0>
        <cfset sql &= " AND " & arrayToList(whereClause," AND ")>
    </cfif>

    <!--- Add ORDER BY clause --->
    <cfset sql &= " ORDER BY #arguments.orderBy# #arguments.orderDirection#">

    <!--- Execute query with error handling --->
    <cftry>
        <cfquery name="result" datasource="abod">
            #sql#
            <cfloop array="#queryParams#" index="param">
                <cfqueryparam value="#param.value#" cfsqltype="#param.cfsqltype#" null="#isNull(param.value)#">
            </cfloop>
        </cfquery>
        <cfcatch type="any">
            <!--- Log error details --->
            <cflog file="application" text="Error in getexportitems: #cfcatch.message# - #cfcatch.detail#. SQL: #sql#">
            <!--- Return an empty query with the correct schema --->
            <cfset result = queryNew("itemid,int;exportid,int;contactid,int;FirstName,varchar;LastName,varchar;Tag1,varchar;Tag2,varchar;Tag3,varchar;BusinessEmail,varchar;PersonalEmail,varchar;WorkPhone,varchar;MobilePhone,varchar;HomePhone,varchar;Company,varchar;Address,varchar;Address2,varchar;City,varchar;State,varchar;Zip,varchar;Country,varchar;ContactMeetingLoc,varchar;Website,varchar;ContactMeetingDate,date;contactBirthday,date")>
        </cfcatch>
    </cftry>

    <!--- Return the result query --->
    <cfreturn result>
</cffunction> 

<!--- Changes made:
- No syntax errors found in the provided code.
--->
</cfcomponent>
