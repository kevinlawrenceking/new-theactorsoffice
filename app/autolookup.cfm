<cfset userid = url.userid>
<cfset searchTerm = url.searchTerm>

<cfquery name="tagData">
    SELECT tagname AS col1, tagname as id
    FROM tags_user
    WHERE userid = <cfqueryparam value="#userid#" cfsqltype="cf_sql_integer">
    AND LOWER(tagname) LIKE LOWER(<cfqueryparam value="%#searchTerm#%" cfsqltype="cf_sql_varchar">)
    ORDER BY tagname
</cfquery>

<cfquery name="contactData">
    SELECT recordname AS col1, contactid as id
    FROM contactdetails
    WHERE userid = <cfqueryparam value="#userid#" cfsqltype="cf_sql_integer">
    AND LOWER(recordname) LIKE LOWER(<cfqueryparam value="%#searchTerm#%" cfsqltype="cf_sql_varchar">)
    ORDER BY recordname
</cfquery>

<cfquery name="appointmentData">
    SELECT e.eventid as id, CONCAT(DATE_FORMAT(e.eventstart, '%m/%d/%Y'), ": ", c.recordname, " - ", e.eventtitle) AS col1
    FROM events e
    INNER JOIN eventtypes_user t ON t.eventtypename = e.eventtypename
    INNER JOIN eventcontactsxref x ON x.eventID = e.eventid
    INNER JOIN contactdetails c ON c.contactid = x.contactid
    WHERE e.userid = <cfqueryparam value="#userid#" cfsqltype="cf_sql_integer">
    AND t.userid = <cfqueryparam value="#userid#" cfsqltype="cf_sql_integer">
    AND e.eventstart >= CURDATE()
    AND LOWER(c.recordname) LIKE LOWER(<cfqueryparam value="%#searchTerm#%" cfsqltype="cf_sql_varchar">)
</cfquery>

<!--- Create suggestions array --->
<cfset suggestions = [] />

<!--- Loop through tagData --->
<cfloop query="tagData">
    <cfset arrayAppend(suggestions, {
        "value": tagData.col1,
        "id": tagData.id,
        "data": {
            "category": "Tags"
        }
    })>
</cfloop>

<!--- Loop through contactData --->
<cfloop query="contactData">
    <cfset arrayAppend(suggestions, {
        "value": contactData.col1,
        "id": contactData.id,
        "data": {
            "category": "Contacts"
        }
    })>
</cfloop>

<!--- Loop through appointmentData --->
<cfloop query="appointmentData">
    <cfset arrayAppend(suggestions, {
        "value": appointmentData.col1,
        "id": appointmentData.id,
        "data": {
            "category": "Appointments"
        }
    })>
</cfloop>

<!--- Return JSON response --->
<cfcontent type="application/json">
<cfoutput>#serializeJSON({"suggestions": suggestions})#</cfoutput>
