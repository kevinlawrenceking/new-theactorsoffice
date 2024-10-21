<cfcomponent displayname="UserService" hint="Handles operations for User table" output="false" > 


  
<cffunction name="getUserById" access="public" returntype="query">
    <cfargument name="userID" type="numeric" required="true">
    <cfset var queryResult = "">

 
 
        <cfquery name="queryResult" datasource="abod" >
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

        <Cfoutput>#queryResult.contactid#</cfoutput>

    <cfset queryResult = queryNew(
    "userID,    contactid",
    "integer,   integer")>
 
    <cfreturn queryResult>
</cffunction>
</cfcomponent>