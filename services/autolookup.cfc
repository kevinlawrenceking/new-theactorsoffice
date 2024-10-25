<cfcomponent displayname="autolookup" output="false" hint="Handles autolookup">

    <cffunction name="getAutoLookupData" access="remote" returntype="json" output="false" hint="Retrieve filtered lookup data for the autocomplete input.">
        <cfargument name="userid" required="true" type="numeric" hint="User ID"/>
        <cfargument name="searchTerm" required="false" type="string" default="" hint="Search term for filtering"/>


        <cfheader name="Content-Type" value="application/json">

        <cfquery name="tagData">
            SELECT tagname AS col1
            FROM tags_user
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">
            AND LOWER(tagname) LIKE LOWER(<cfqueryparam value="%#arguments.searchTerm#%" cfsqltype="cf_sql_varchar">)
            ORDER BY tagname
        </cfquery>

        <cfquery name="contactData">
            SELECT recordname AS col1
            FROM contactdetails
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">
            AND LOWER(recordname) LIKE LOWER(<cfqueryparam value="%#arguments.searchTerm#%" cfsqltype="cf_sql_varchar">)
            ORDER BY recordname
        </cfquery>

        <cfquery name="appointmentData">
            SELECT CONCAT(DATE_FORMAT(e.eventstart, '%m/%d/%Y'), ": ", c.recordname, " - ", e.eventtitle) AS col1
            FROM events e
            INNER JOIN eventtypes_user t ON t.eventtypename = e.eventtypename
            INNER JOIN eventcontactsxref x ON x.eventID = e.eventid
            INNER JOIN contactdetails c ON c.contactid = x.contactid
            WHERE e.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">
            AND t.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">
            AND e.eventstart >= CURDATE()
            AND LOWER(c.recordname) LIKE LOWER(<cfqueryparam value="%#arguments.searchTerm#%" cfsqltype="cf_sql_varchar">)
        </cfquery>
        <cfset suggestions = [] />
        <cfloop query="tagData">
            <cfset arrayAppend(suggestions, {
                "value": tagData.col1,
                "data": {
                    "category": "Tags"
                }
            })>
        </cfloop>
        <cfloop query="contactData">
            <cfset arrayAppend(suggestions, {
                "value": contactData.col1,
                "data": {
                    "category": "Contacts"
                }
            })>
        </cfloop>
        <cfloop query="appointmentData">
            <cfset arrayAppend(suggestions, {
                "value": appointmentData.col1,
                "data": {
                    "category": "Appointments"
                }
            })>
        </cfloop>
        <cfoutput>#serializeJSON({"suggestions": suggestions})#</cfoutput>
    </cffunction>

</cfcomponent>
