<cfcomponent displayname="LookupService" hint="Handles operations for the Lookup table" >

<cffunction name="getContacts" access="public" returntype="query" output="false" hint="Fetches contacts for a given user ID and search term.">
    <cfargument name="userId" type="numeric" required="true" hint="The user ID to filter contacts.">
    <cfargument name="searchTerm" type="string" required="true" hint="The term to search for in contacts." default="">

    <cfquery name="contactData">
        SELECT 
            col1, 
            CONCAT('/app/contact/?contactid=', contactid) AS contact_url
        FROM 
            contacts_ss
        WHERE 
            userid = <cfqueryparam value="#arguments.userId#" cfsqltype="CF_SQL_INTEGER">
            AND col1 LIKE <cfqueryparam value="#arguments.searchTerm#%" cfsqltype="CF_SQL_VARCHAR">
            AND col1 NOT LIKE <cfqueryparam value="%#chr(34)#%" cfsqltype="CF_SQL_VARCHAR">
        ORDER BY col1 ASC
    </cfquery>

    <cfreturn contactData>
</cffunction>



</cfcomponent>