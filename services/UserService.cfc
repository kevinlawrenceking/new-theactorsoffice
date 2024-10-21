<cfcomponent displayname="UserService" hint="Handles operations for User table" output="false"> 

    <cffunction name="getUserByIds" access="public" returntype="query">
        <cfargument name="userID" type="numeric" required="true">
        <cfset var queryResult = "">

        <!--- Perform the query to get the user data --->
        <cfquery name="queryResult" datasource="abod">
            SELECT userID, contactid, defRows, customerid, viewtypeid, dateFormatID, 
                   region_id, userFirstName, userLastName, userEmail, userRole, 
                   nletter_link, avatarName, defCountry, defState, tzid, userstatus, 
                   recover, userPassword, add1, add2, city, regionid,
                   zip, imdbid, countryid, access_token, refresh_token, datePrefID, 
                   IsDeleted, IsBetaTester, isAudition, isAuditionModule, isSetup, nletter_yn, 
                   passwordHash, passwordSalt, def_regionid, calStartTime, calEndTime, calSlotDuration
            FROM taousers_tbl
            WHERE userID = <cfqueryparam value="#arguments.userID#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <!--- Output for debugging (remove this in production) --->
        <Cfoutput>#queryResult.contactid#</Cfoutput>

        <!--- Return the actual query result, without overwriting it --->
        <cfreturn queryResult>
    </cffunction>

</cfcomponent>