<cfcomponent displayname="BirthdaysService"  hint="List of contactbirthdays">
    <cffunction output="false" name="getBirthdaysForDashboard" access="public" returntype="query"  hint="Retrieves upcoming birthdays for a specific user">
        <!--- Arguments --->
        <cfargument name="userid" type="numeric" required="true" hint="The user ID to retrieve birthdays for">
        <cfargument name="daysLimit" type="numeric" required="false" default="15" hint="The number of days ahead to check for birthdays">
        <cfargument name="maxRows" type="numeric" required="false" default="10" hint="The maximum number of rows to return">

        <!--- Query to retrieve the upcoming birthdays --->
        <cfquery result="result" name="birthdays" maxrows="#arguments.maxRows#">
            SELECT  
                datediff(d.contactbirthday, curdate()) as daysuntil,   
                d.contactfullname AS col1,
                d.contactid,
                DATE_FORMAT(d.contactbirthday,'%m-%d') as col2
            FROM contactdetails d
            WHERE 
                d.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer"> 
                AND d.contactbirthday IS NOT NULL 
                AND datediff(d.contactbirthday, curdate()) < <cfqueryparam value="#arguments.daysLimit#" cfsqltype="cf_sql_integer">
            ORDER BY datediff(d.contactbirthday, curdate())
        </cfquery>

        <!--- Return the query result --->
        <cfreturn birthdays>
    </cffunction>

</cfcomponent>