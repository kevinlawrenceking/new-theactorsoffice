<cfcomponent extends="/app/Application">
    <!-- This Application.cfc acts as a proxy to the main Application.cfc in /app -->

     <cffunction name="formatDate" access="public" returntype="string" output="false" hint="Formats dates according to the user's preferences">
    <cfargument name="dateValue" required="true" type="date" hint="The date to be formatted">
    
    <!--- Use session date format or default to mm/dd/yyyy --->
    <cfset var dateFormatToUse = "mm/dd/yyyy">
    <cfif structKeyExists(session, "dateformatExample")>
        <cfset dateFormatToUse = session.dateformatExample>
    </cfif>

    <!--- Format the date --->
    <cfreturn dateFormat(arguments.dateValue, dateFormatToUse)>
</cffunction>
    <cfquery name="getUserPreferences">
        SELECT 
            u.dateformatid, 
            d.formatExample
        FROM 
            taouser u
        LEFT JOIN 
            dateformats d ON u.dateformatid = d.id
        WHERE 
            u.userid = <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>

    <cfif getUserPreferences.recordcount>
        <cfset session.user = {
            dateformatid = getUserPreferences.dateformatid,
            dateformatExample = getUserPreferences.formatExample
        }>
    <cfelse>
        <!-- Fallback to default -->
        <cfset session.user = {
            dateformatid = 1,
            dateformatExample = "mm/dd/yyyy"
        }>
    </cfif>

 
    <cfset session.formatDate = function(dateToFormat) {
        var format = StructKeyExists(session.user, "dateformatExample") ? session.user.dateformatExample : "mm/dd/yyyy";
        return DateFormat(dateToFormat, format);
    }>
</cffunction>
    </cfcomponent>