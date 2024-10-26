<cfcomponent displayname="ContactsService" output="false" hint="Handles contact-related operations">

    <cffunction name="getContacts" access="public" returntype="query" output="false" hint="Retrieves filtered contacts for the datatable">
        <cfargument name="userid" type="numeric" required="true" hint="User ID">
        <cfargument name="search" type="string" required="false" default="" hint="Search string">
        <cfargument name="bytag" type="string" required="false" default="" hint="Filter by tag">
        <cfargument name="byimport" type="numeric" required="false" default="0" hint="Filter by import ID">
        <cfargument name="bylike" type="string" required="false" default="" hint="Filter by column like">
        <cfargument name="uploadid" type="numeric" required="false" default="0" hint="Filter by upload ID">
        <cfargument name="orderColumn" type="numeric" required="false" default="0" hint="Order by column">
        <cfargument name="orderDir" type="string" required="false" default="asc" hint="Order direction">
        <cfargument name="start" type="numeric" required="false" default="0" hint="Pagination start">
        <cfargument name="length" type="numeric" required="false" default="10" hint="Pagination length">
        
        <cfset var columns = "`contactid`,`col1`,`col2`,`col2b`,`col3`,`col4`,`col5`">
        
        <cfquery name="qFiltered" datasource="your_datasource">
            SELECT contactid, col1, col2, col2b, col3, col4, col5, userid, hlink 
            FROM contactdetails
            WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">

            <!-- Filter by tag -->
            <cfif len(trim(arguments.bytag))>
                AND contactid IN (SELECT contactid FROM contactitems WHERE valuetype = 'tags' AND itemstatus = 'active' AND valuetext = <cfqueryparam value="#arguments.bytag#" cfsqltype="cf_sql_varchar">)
            </cfif>

            <!-- Filter by import -->
            <cfif isNumeric(arguments.byimport) AND arguments.byimport gt 0>
                AND contactid IN (SELECT contactid FROM contactsimport WHERE uploadid = <cfqueryparam value="#arguments.byimport#" cfsqltype="cf_sql_integer">)
            </cfif>

            <!-- Filter by like condition -->
            <cfif len(trim(arguments.bylike))>
                AND col1 LIKE <cfqueryparam value="%#trim(arguments.bylike)#%" cfsqltype="cf_sql_varchar">
            </cfif>

            <!-- Filter by upload ID -->
            <cfif isNumeric(arguments.uploadid) AND arguments.uploadid gt 0>
                AND contactid IN (SELECT contactid FROM contactsimport WHERE uploadid = <cfqueryparam value="#arguments.uploadid#" cfsqltype="cf_sql_integer">)
            </cfif>

            <!-- Search filter -->
            <cfif len(trim(arguments.search))>
                <cfif trim(arguments.search) eq "no system">
                    AND contactid NOT IN (SELECT contactid FROM contacts_ss_followup WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">)
                    AND contactid NOT IN (SELECT contactid FROM contacts_ss_maint WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">)
                    AND contactid NOT IN (SELECT contactid FROM contacts_ss_target WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">)
                <cfelse>
                    AND (
                        <cfloop list="#columns#" index="thisColumn">
                            <cfif thisColumn neq listFirst(columns)>OR </cfif>
                            #thisColumn# LIKE <cfqueryparam value="%#trim(arguments.search)#%" cfsqltype="cf_sql_varchar">
                        </cfloop>
                    )
                </cfif>
            </cfif>

            <!-- Ordering -->
            <cfif arguments.orderColumn gt 0>
                ORDER BY
                <cfif arguments.orderColumn eq '1'>col1 <cfif arguments.orderDir eq 'desc'>DESC</cfif></cfif>
                <cfif arguments.orderColumn eq '2'>col2 <cfif arguments.orderDir eq 'desc'>DESC</cfif></cfif>
                <cfif arguments.orderColumn eq '3'>col2b <cfif arguments.orderDir eq 'desc'>DESC</cfif></cfif>
                <cfif arguments.orderColumn eq '4'>col3 <cfif arguments.orderDir eq 'desc'>DESC</cfif></cfif>
                <cfif arguments.orderColumn eq '5'>col4 <cfif arguments.orderDir eq 'desc'>DESC</cfif></cfif>
                <cfif arguments.orderColumn eq '6'>col5 <cfif arguments.orderDir eq 'desc'>DESC</cfif></cfif>
            </cfif>

            LIMIT <cfqueryparam value="#arguments.start#" cfsqltype="cf_sql_integer">, <cfqueryparam value="#arguments.length#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfreturn qFiltered>
    </cffunction>

</cfcomponent>
