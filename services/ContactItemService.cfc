<cfcomponent displayname="ContactItemService" hint="Handles operations for ContactItem table" output="false"> 
<cffunction name="itemsByCatActive" access="public" returntype="struct">
    <!--- Define required arguments --->
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="valueCategory" type="string" required="true">
    <cfargument name="catArea_UCB" type="string" required="true">

    <!--- Query to fetch items by category with active status --->
    <cfquery result="result" name="itemsbycatActive">
        SELECT 
            i.itemID,
            i.valueType,
            i.valueCategory,
            i.valuetext,
            i.valueCompany,
            i.valuedepartment,
            i.valuetitle,
            i.valueStreetAddress,
            i.valueExtendedAddress,
            i.valueCity,
            i.valueRegion,
            i.itemDate,
            i.itemNotes,
            i.itemStatus,
            i.itemCreationDate,
            i.itemLastUpdated,
            i.valueCountry,
            c.catfieldset,
            c.caticon,
            i.valuepostalcode,
            i.primary_yn
        FROM contactitems i
        INNER JOIN itemcategory c ON c.valueCategory = i.valuecategory
        WHERE i.contactID = <cfqueryparam value="#arguments.contactid#" cfsqltype="cf_sql_integer">
          AND c.valuecategory = <cfqueryparam value="#arguments.valueCategory#" cfsqltype="cf_sql_varchar">
          AND i.itemstatus = 'Active'
          AND i.valuecategory <> 'Tag'
          AND c.catArea_UCB IN ('B', <cfqueryparam value="#arguments.catArea_UCB#" cfsqltype="cf_sql_varchar">)
        ORDER BY i.valuetext
    </cfquery>

    <!--- Create struct to hold query and record count --->
    <cfset var resultStruct = structNew()>
    <cfset resultStruct.itemsbycatActive = itemsbycatActive>
    <cfset resultStruct.recordcount = itemsbycatActive.recordcount>

    <cfreturn resultStruct>
</cffunction>


   <!--- Function to retrieve active categories --->
    <cffunction name="getActiveCategories" access="remote" returntype="query" output="false" hint="Get a list of active categories.">
        <cfquery result="result" name="ActiveCategories">
            SELECT 'Relationship' AS valueCategory, 'fe-users' AS caticon,'text' AS catFieldSet, 0 AS catid, 0 AS finalorder
            UNION
            SELECT DISTINCT
                c.valueCategory,
                c.caticon,
                c.catfieldset,
                c.catid,
                c.catOrder AS finalorder
            FROM itemcategory c
            WHERE c.valuecategory <> 'Tag'
            ORDER BY finalorder
        </cfquery>
        <!--- Return the query result --->
        <cfreturn ActiveCategories />
    </cffunction>
    
    <!--- Function to retrieve inactive categories --->
    <cffunction name="getInactiveCategories" access="remote" returntype="query" output="false" hint="Get a list of inactive categories.">
        <cfquery result="result" name="InactiveCategories">
            SELECT 'Relationship' AS valueCategory, 'fe-users' AS caticon,'text' AS catFieldSet, 0 AS catid, 0 AS finalorder
            UNION
            SELECT DISTINCT
                c.valueCategory,
                c.caticon,
                c.catfieldset,
                c.catid,
                c.catOrder AS finalorder
            FROM itemcategory c
            WHERE c.valuecategory <> 'Tag' AND c.catid = 0
            ORDER BY finalorder
        </cfquery>
        <!--- Return the query result --->
        <cfreturn InactiveCategories />
    </cffunction>




<cffunction name="SELfindscope_24712" access="public" returntype="string">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfquery result="result" name="findscope"  maxrows="1">
        SELECT 
            CASE 
                WHEN EXISTS (
                    SELECT 1 
                    FROM contactitems 
                    WHERE valuecategory = 'Tag' 
                      AND contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="cf_sql_integer"> 
                      AND itemstatus = 'Active' 
                      AND valuetext IN (
                        SELECT tagname 
                        FROM tags_user 
                        WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer"> 
                          AND tagtype = 'C'
                      )
                ) THEN 'Casting Director'
                ELSE 'Industry'
            END AS new_systemscope
    </cfquery>
    
    <cfreturn findscope.new_systemscope[1]>
</cffunction>

<cffunction name="SELcontactitems" access="public" returntype="query">
    <cfargument name="contactId" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                contactid, 
                itemid, 
                CONCAT(' <span class=''badge badge-blue''>', contactitems.valueText, '</span>') AS tag, 
                contactitems.valuetext
            FROM 
                contactitems
            WHERE 
                contactid = <cfqueryparam value="#arguments.contactId#" cfsqltype="CF_SQL_INTEGER"> 
                AND valueCategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR"> 
                AND valuetext <> ''
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactItems: #cfcatch.message#">
            <cfset result = queryNew("contactid,itemid,tag,valuetext")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_23758" access="public" returntype="query">
    <cfargument name="contactID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT contactitems.valueText AS phone
            FROM contactitems
            WHERE contactitems.valueCategory = <cfqueryparam value="Phone" cfsqltype="CF_SQL_VARCHAR">
            AND contactitems.contactID = <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
            AND contactitems.itemStatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            ORDER BY contactitems.primary_YN DESC
            LIMIT 1
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getActivePhone: #cfcatch.message# Query: SELECT contactitems.valueText AS phone FROM contactitems WHERE contactitems.valueCategory = 'Phone' AND contactitems.contactID = #arguments.contactID# AND contactitems.itemStatus = 'Active' ORDER BY contactitems.primary_YN DESC LIMIT 1">
            <cfreturn queryNew("phone", "varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_23759" access="public" returntype="query">
    <cfargument name="contactID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT contactitems.valueText AS email
            FROM contactitems
            WHERE contactitems.valueCategory = <cfqueryparam value="Email" cfsqltype="CF_SQL_VARCHAR">
            AND contactitems.contactID = <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
            AND contactitems.itemStatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            ORDER BY contactitems.primary_YN DESC
            LIMIT 1
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getActiveEmail: #cfcatch.message#">
            <cfset result = queryNew("email", "varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INScontactitems" access="public" returntype="void">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="cdtype" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO CONTACTITEMS (CONTACTID, VALUETYPE, VALUECATEGORY, VALUETEXT, ITEMSTATUS)
            VALUES (
                <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Tags" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.cdtype#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in insertContactItem: #cfcatch.message#">
            <cfthrow message="Database error occurred while inserting contact item.">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_23771" access="public" returntype="void">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="cdco" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO CONTACTITEMS (CONTACTID, VALUETYPE, VALUECATEGORY, ValueCompany, ITEMSTATUS)
            VALUES (
                <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Company" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Company" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.cdco#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="Error inserting contact item: #cfcatch.message#">
        <cfthrow message="Database error occurred while inserting contact item." detail="#cfcatch.detail#">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactitems_23840" access="public" returntype="query">
    <cfargument name="currentid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT i.itemid, c.catid, c.valuecategory
            FROM contactitems i
            INNER JOIN itemcategory c ON c.valuecategory = i.valuecategory
            WHERE contactid = <cfqueryparam value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactItems: #cfcatch.message# Query: SELECT i.itemid, c.catid, c.valuecategory FROM contactitems i INNER JOIN itemcategory c ON c.valuecategory = i.valuecategory WHERE contactid = #arguments.currentid#">
            <cfset result = queryNew("itemid, catid, valuecategory", "integer, integer, varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_23855" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT contactid, itemid, `contactitems`.`valueText` AS tag
            FROM contactitems
            WHERE contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
            AND valuetext <> <cfqueryparam value="My Team" cfsqltype="CF_SQL_VARCHAR">
            AND valuecategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactItems: #cfcatch.message# Query: SELECT contactid, itemid, `contactitems`.`valueText` AS tag FROM contactitems WHERE contactid = #arguments.contactid# AND valuetext <> 'My Team' AND valuecategory = 'Tag'">
            <cfthrow>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="DETcontactitems" access="public" returntype="query">
    <cfargument name="itemid" type="numeric" required="true">
    
    <cfset var queryResult = "">
    
    <cftry>
        <cfquery result="result" name="queryResult" >
            SELECT 
                i.itemid, 
                i.contactid, 
                i.valueText 
            FROM 
                contactitems i 
            WHERE 
                i.itemid = <cfqueryparam value="#arguments.itemid#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactItems: #cfcatch.message# Query: SELECT i.itemid, i.contactid, i.valueText FROM contactitems i WHERE i.itemid = ? Parameters: #arguments.itemid#">
            <cfthrow message="An error occurred while retrieving contact items." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn queryResult>
</cffunction>
<cffunction name="SELcontactitems_23889" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfset var queryResult = "">
    <cftry>
        <cfquery result="result" name="queryResult" >
            SELECT valuetext AS new_website 
            FROM contactitems 
            WHERE valuetype = <cfqueryparam cfsqltype="cf_sql_varchar" value="Company Website" />
            AND contactid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_contactid#" />
            AND itemstatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory = <cfqueryparam cfsqltype="cf_sql_varchar" value="URL" />
        </cfquery>
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getNewWebsite: #cfcatch.message# Query: SELECT valuetext AS new_website FROM contactitems WHERE valuetype = 'Company Website' AND contactid = #arguments.new_contactid# AND itemstatus = 'Active' AND valuecategory = 'URL'" />
            <cfthrow message="An error occurred while fetching the new website." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    <cfreturn queryResult>
</cffunction>
<cffunction name="SELcontactitems_23890" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfset var result = "">
    <cftry>
        <cfquery name="result" >
            SELECT valuetext AS new_businessEmail 
            FROM contactitems 
            WHERE valuetype = <cfqueryparam cfsqltype="cf_sql_varchar" value="Business" /> 
            AND contactid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_contactid#" /> 
            AND itemstatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" /> 
            AND valuecategory = <cfqueryparam cfsqltype="cf_sql_varchar" value="Email" />
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getBusinessEmail: #cfcatch.message#" />
            <cfset result = queryNew("new_businessEmail", "varchar")>
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_23891" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfset var result = "">
    <cftry>
        <cfquery name="result" >
            SELECT valuetext AS new_PersonalEmail
            FROM contactitems
            WHERE valuetype = <cfqueryparam cfsqltype="cf_sql_varchar" value="Personal" />
            AND contactid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_contactid#" />
            AND itemstatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory = <cfqueryparam cfsqltype="cf_sql_varchar" value="Email" />
        </cfquery>
        <cfcatch>
            <cflog file="errorLog" text="Error in getPersonalEmail: #cfcatch.message#" type="error">
            <cfthrow message="An error occurred while retrieving the personal email." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_23892" access="public" returntype="query">
    <cfargument name="contactId" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT valuecompany AS new_Company
            FROM contactitems
            WHERE contactid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.contactId#" />
            AND itemstatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory = <cfqueryparam cfsqltype="cf_sql_varchar" value="Company" />
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getCompanyByContactId: #cfcatch.message#">
            <cfset result = queryNew("new_Company", "varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_23893" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT valuetext AS new_WorkPhone
            FROM contactitems
            WHERE valuetype = <cfqueryparam cfsqltype="cf_sql_varchar" value="Work" />
            AND contactid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_contactid#" />
            AND itemstatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory = <cfqueryparam cfsqltype="cf_sql_varchar" value="Phone" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getWorkPhone: #cfcatch.message# Query: SELECT valuetext AS new_WorkPhone FROM contactitems WHERE valuetype = 'Work' AND contactid = #arguments.new_contactid# AND itemstatus = 'Active' AND valuecategory = 'Phone'">
            <cfthrow message="An error occurred while retrieving work phone." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_23894" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT valuetext AS new_mobilePhone 
            FROM contactitems 
            WHERE valuetype = <cfqueryparam cfsqltype="cf_sql_varchar" value="mobile" />
            AND contactid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_contactid#" />
            AND itemstatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory = <cfqueryparam cfsqltype="cf_sql_varchar" value="Phone" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getNewMobilePhone: #cfcatch.message#">
            <cfthrow message="Error retrieving mobile phone data.">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_23895" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfset var queryResult = "">
    
    <cftry>
        <cfquery result="result" name="queryResult" >
            SELECT valuetext AS new_homePhone 
            FROM contactitems 
            WHERE valuetype = <cfqueryparam cfsqltype="cf_sql_varchar" value="home" /> 
            AND contactid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_contactid#" /> 
            AND itemstatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" /> 
            AND valuecategory = <cfqueryparam cfsqltype="cf_sql_varchar" value="Phone" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getNewHomePhone: #cfcatch.message#">
            <cfthrow message="Database query failed." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction>
<cffunction name="SELcontactitems_23896" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                valuestreetaddress AS new_address, 
                valueextendedaddress AS new_address2, 
                valuecity AS new_city, 
                valueregion AS new_state, 
                valuepostalcode AS new_zip 
            FROM 
                contactitems 
            WHERE 
                valuetype = <cfqueryparam cfsqltype="cf_sql_varchar" value="Business" /> 
                AND contactid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_contactid#" /> 
                AND itemstatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" /> 
                AND valuecategory = <cfqueryparam cfsqltype="cf_sql_varchar" value="Address" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getBusinessAddress: #cfcatch.message#">
            <cfreturn queryNew("new_address,new_address2,new_city,new_state,new_zip","varchar,varchar,varchar,varchar,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_23897" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                valuestreetaddress AS new_address, 
                valueextendedaddress AS new_address2, 
                valuecity AS new_city, 
                valueregion AS new_state, 
                valuepostalcode AS new_zip, 
                valueCountry AS new_country 
            FROM 
                contactitems 
            WHERE 
                contactid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.new_contactid#" /> 
                AND itemstatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" /> 
                AND valuecategory = <cfqueryparam cfsqltype="cf_sql_varchar" value="Address" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactAddress: #cfcatch.message#">
            <cfreturn queryNew("new_address,new_address2,new_city,new_state,new_zip,new_country")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_23898" access="public" returntype="query">
    <cfargument name="contactID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT valuetext AS tag
            FROM contactitems
            WHERE valueCategory = <cfqueryparam cfsqltype="cf_sql_varchar" value="Tag" />
            AND itemstatus = <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND contactID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.contactID#" />
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactTags: #cfcatch.message#">
            <cfset result = queryNew("tag", "varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="DETcontactitems_23910" access="public" returntype="query">
    <cfargument name="itemid" type="numeric" required="true">
    
    <cfset var queryResult = "">
    
    <cftry>
        <cfquery result="result" name="queryResult" >
            SELECT i.itemid, i.valueText
            FROM contactitems i
            WHERE i.itemid = <cfqueryparam value="#arguments.itemid#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactItems: #cfcatch.message#">
            <cfreturn queryNew("itemid,valueText", "integer,varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn queryResult>
</cffunction>
<cffunction name="REScontactitems" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="uploadid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                d.contactid, 
                'Name' AS head1, 
                'Tags' AS head2, 
                'Phone' AS head3, 
                'Email' AS head4, 
                'Company' AS head5, 
                'Status' AS head6, 
                c.status, 
                d.contactfullname AS col1,
                (SELECT GROUP_CONCAT(CONCAT("<span class='badge badge-blue'>", valueText, "</span>") SEPARATOR ' ') 
                 FROM contactitems 
                 WHERE valueCategory = 'Tag' AND contactID = d.ContactID AND itemstatus = 'Active' LIMIT 1) AS col2,
                (SELECT valueText FROM contactitems WHERE valueCategory = 'Phone' AND contactID = d.ContactID AND itemstatus = 'Active' LIMIT 1) AS col3,
                (SELECT valueText FROM contactitems WHERE valueCategory = 'Email' AND contactID = d.ContactID AND itemstatus = 'Active' LIMIT 1) AS col4,
                (SELECT valueCompany FROM contactitems WHERE contactID = d.ContactID AND valueCategory = 'Company' AND itemstatus = 'active' LIMIT 1) AS col5
            FROM 
                contactdetails d
            INNER JOIN 
                contactsimport c ON c.contactid = d.contactid
            WHERE 
                d.contactStatus = 'Active'
                AND d.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
                AND c.uploadid = <cfqueryparam value="#arguments.uploadid#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY 
                d.contactfullname
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveContacts: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
</cffunction>
<cfscript>
function getContactDetails(required numeric uploadid) {
    var result = queryNew("contactid, head1, head2, head3, head4, head5, head6, status, col1, col2, col3, col4, col5", "integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar");
    
    try {
        var sql = "
            SELECT 
                d.contactid, 
                'Name' AS head1, 
                'Tags' AS head2, 
                'Phone' AS head3, 
                'Email' AS head4, 
                'Company' AS head5, 
                'Status' AS head6, 
                c.status, 
                d.contactfullname AS col1,
                (SELECT GROUP_CONCAT(CONCAT('<span class=''badge badge-blue''>', valueText, '</span>') SEPARATOR ' ') FROM contactitems WHERE valueCategory = 'Tag' AND contactID = d.ContactID AND itemstatus = 'Active' LIMIT 1) AS col2,
                (SELECT valueText FROM contactitems WHERE valueCategory = 'Phone' AND contactID = d.ContactID AND itemstatus = 'Active' LIMIT 1) AS col3,
                (SELECT valueText FROM contactitems WHERE valueCategory = 'Email' AND contactID = d.ContactID AND itemstatus = 'Active' LIMIT 1) AS col4,
                (SELECT valueCompany FROM contactitems WHERE contactID = d.ContactID AND valueCategory = 'Company' AND itemstatus = 'active' LIMIT 1) AS col5
            FROM 
                contactdetails d
            INNER JOIN 
                contactsimport c ON c.contactid = d.contactid
            WHERE 
                c.uploadid = ?
            ORDER BY 
                d.contactfullname";

        result = queryExecute(
            sql,
            {uploadid={value=arguments.uploadid, cfsqltype="CF_SQL_INTEGER"}},
            {}
        );
    } catch (any e) {
        cflog(type="error", text="Error in getContactDetails: #e.message#");
    }
    
    return result;
}
</cfscript>

<cffunction name="INScontactitems_23947" access="public" returntype="void">
    <cfargument name="new_contactid" type="numeric" required="true">
    
    <cftry>
        <cfquery result="result" name="insertQuery" >
            INSERT INTO contactitems (
                contactid, 
                valuetype, 
                valuecategory, 
                valuetext, 
                itemstatus, 
                primary_yn
            ) VALUES (
                <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Tags" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="My Team" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Y" cfsqltype="CF_SQL_CHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error inserting contact item: #cfcatch.message#">
            <cfthrow message="Error inserting contact item." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactitems_23948" access="public" returntype="query">
    <cfargument name="deletecontactid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT itemid 
            FROM contactitems 
            WHERE contactid = <cfqueryparam value="#arguments.deletecontactid#" cfsqltype="CF_SQL_INTEGER"> 
            AND valuetext = <cfqueryparam value="My Team" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactItemsByContactId: #cfcatch.message#" type="error">
            <cfset result = queryNew("itemid")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="UPDcontactitems" access="public" returntype="void">
    <cfargument name="new_itemid" type="numeric" required="true">

    <cftry>
        <cfquery result="result" >
            UPDATE contactitems_tbl 
            SET isdeleted = 1 
            WHERE itemid = <cfqueryparam value="#arguments.new_itemid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating contact item: #cfcatch.message# Query: UPDATE contactitems_tbl SET isdeleted = 1 WHERE itemid = #arguments.new_itemid#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDcontactitems_23952" access="public" returntype="void">
    <cfargument name="itemid" type="numeric" required="true">
    <cfargument name="contactid" type="numeric" required="true">

    <cftry>
        <cfquery result="result" name="updateQuery" >
            UPDATE contactitems 
            SET isDeleted = 1 
            WHERE itemid = <cfqueryparam value="#arguments.itemid#" cfsqltype="CF_SQL_INTEGER"> 
            AND contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating contact items: #cfcatch.message# Query: UPDATE contactitems SET isDeleted = 1 WHERE itemid = #arguments.itemid# AND contactid = #arguments.contactid#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDcontactitems_23953" access="public" returntype="void">
    <cfargument name="currentid" type="numeric" required="true">
    
    <cftry>
        <cfquery result="result" >
            UPDATE contactitems 
            SET isDeleted = 1 
            WHERE contactid = <cfqueryparam value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER"> 
            AND itemstatus = <cfqueryparam value="Pending" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating contact items: #cfcatch.message# Query: UPDATE contactitems SET isDeleted = 1 WHERE contactid = #arguments.currentid# AND itemstatus = 'Pending'">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactitems_23954" access="public" returntype="query">
    <cfargument name="currentid" type="numeric" required="true">
    <cfargument name="valuecategory" type="string" required="true">

    <cfset var result = "">

    <cftry>
        <cfquery name="result" >
            SELECT itemid 
            FROM contactitems 
            WHERE contactid = <cfqueryparam value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER"> 
            AND valueCategory = <cfqueryparam value="#arguments.valuecategory#" cfsqltype="CF_SQL_VARCHAR"> 
            AND itemStatus = 'Pending'
        </cfquery>
        <cfcatch>
            <cflog file="application" text="Error in getPendingContactItems: #cfcatch.message#">
            <cfthrow message="Database query error" detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="INScontactitems_23955" access="public" returntype="void">
    <cfargument name="contactID" type="numeric" required="true">
    <cfargument name="valueTypeDef" type="string" required="true">
    <cfargument name="valuecategory" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO contactitems (contactID, valueType, valuecategory, itemStatus) 
            VALUES (
                <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.valueTypeDef#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.valuecategory#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Pending" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactItem: #cfcatch.message#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactitems_23962" access="public" returntype="query">
    <cfargument name="contactId" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                contactid, 
                itemid, 
                concat(' <span class=''badge badge-blue''>', contactitems.valueText, '</span>') as tag, 
                contactitems.valuetext
            FROM 
                contactitems
            WHERE 
                contactid = <cfqueryparam value="#arguments.contactId#" cfsqltype="CF_SQL_INTEGER"> 
                AND valuetext <> <cfqueryparam value="My Team" cfsqltype="CF_SQL_VARCHAR">
                AND valuecategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR">
                AND valuetext <> <cfqueryparam value="My Rep Team" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog text="Error in getContactItems: #cfcatch.message# - Query: SELECT contactid, itemid, concat(' <span class=''badge badge-blue''>', contactitems.valueText, '</span>') as tag, contactitems.valuetext FROM contactitems WHERE contactid = ? AND valuetext <> 'My Team' AND valuecategory = 'Tag' AND valuetext <> 'My Rep Team'" type="error">
            <cfset result = queryNew("contactid,itemid,tag,valuetext", "integer,integer,varchar,varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_23963" access="public" returntype="query">
    <cfargument name="contactID" type="numeric" required="true">
    <cfset var result = "">
    <cftry>
        <cfquery name="result" >
            SELECT contactitems.valueText AS phone
            FROM contactitems
            WHERE contactitems.valueCategory = <cfqueryparam value="Phone" cfsqltype="CF_SQL_VARCHAR">
            AND contactitems.contactID = <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
            AND contactitems.itemStatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            ORDER BY contactitems.primary_YN DESC
            LIMIT 1
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getActivePhone: #cfcatch.message# Query: #cfcatch.detail#">
            <cfset result = queryNew("phone", "varchar")>
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_23964" access="public" returntype="query">
    <cfargument name="contactID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT contactitems.valueText AS email
            FROM contactitems
            WHERE contactitems.valueCategory = <cfqueryparam value="Email" cfsqltype="CF_SQL_VARCHAR">
            AND contactitems.contactID = <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
            AND contactitems.itemStatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            ORDER BY contactitems.primary_YN DESC
            LIMIT 1
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveEmail: #cfcatch.message# Query: SELECT contactitems.valueText AS email FROM contactitems WHERE contactitems.valueCategory = 'Email' AND contactitems.contactID = #arguments.contactID# AND contactitems.itemStatus = 'Active' ORDER BY contactitems.primary_YN DESC LIMIT 1. Error: #cfcatch.detail#">
            <cfthrow message="Error retrieving email." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_24040" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT DISTINCT i.valueCompany AS new_valuecompany 
            FROM contactitems i 
            INNER JOIN contactdetails d ON d.contactid = i.contactid 
            WHERE i.VALUEcategory = 'company' 
            AND d.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer"> 
            AND i.valuecompany <> '' 
            AND i.valueCompany IS NOT NULL 
            AND i.valuecompany <> 'Custom' 
            ORDER BY i.valuecompany
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDistinctValueCompany: #cfcatch.message# - Query: #cfcatch.Detail#">
            <cfset result = queryNew("new_valuecompany", "varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="INScontactitems_24043" access="public" returntype="numeric">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="valuetype" type="string" required="true">
    <cfargument name="valueCategory" type="string" required="true">

        <cfquery result="result" >
            INSERT INTO contactitems (contactid, valuetype, itemStatus, valueCategory)
            VALUES (
                <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.contactid#" />,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.valuetype)#" />,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.valueCategory#" />
            )
        </cfquery>
  <cfreturn result.generatedKey>      
</cffunction>
<cffunction name="UPDcontactitems_24046" access="public" returntype="void">
    <cfargument name="valuetext" type="string" required="true">
    <cfargument name="catid" type="string" required="true">
    <cfargument name="valuecompany" type="string" required="false" default="">
    <cfargument name="valueDepartment" type="string" required="false" default="">
    <cfargument name="valueTitle" type="string" required="false" default="">
    <cfargument name="valueStreetAddress" type="string" required="false" default="">
    <cfargument name="valueExtendedAddress" type="string" required="false" default="">
    <cfargument name="valueCity" type="string" required="false" default="">
    <cfargument name="new_regionname" type="string" required="false" default="">
    <cfargument name="new_countryname" type="string" required="false" default="">
    <cfargument name="valuePostalCode" type="string" required="false" default="">
    <cfargument name="itemdate" type="date" required="false">
    <cfargument name="itemid" type="numeric" required="true">

    <cftry>
        <cfquery result="result"  name="updateQuery">
            UPDATE contactitems
            SET valuetext = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.valuetext)#">
            <cfif arguments.catid EQ "9">
                <cfif len(trim(arguments.valuecompany))>
                    , valueCompany = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.valuecompany)#">
                </cfif>
                , valueDepartment = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.valueDepartment)#">
                , valueTitle = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.valueTitle)#">
            </cfif>
            <cfif arguments.catid EQ "2">
                , valueStreetAddress = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.valueStreetAddress)#">
                , valueExtendedAddress = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.valueExtendedAddress)#">
                , valueCity = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.valueCity)#">
                , valueRegion = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_regionname)#">
                , valueCountry = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.new_countryname)#">
                , valuePostalCode = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(arguments.valuePostalCode)#">
            </cfif>
            <cfif isDefined("arguments.itemdate")>
                , itemdate = <cfqueryparam cfsqltype="CF_SQL_DATE" value="#arguments.itemdate#">
            </cfif>
            WHERE itemid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.itemid#">
        </cfquery>
        <!--- Log success or any other necessary actions --->
    <cfcatch>
        <!--- Log error details --->
        <cflog file="applicationLogFileName"
               text="[Error] Updating contactitems failed: #cfcatch.message# - Query: #updateQuery.sql# - Parameters: #serializeJSON(arguments)#">
        <!--- Optionally rethrow or handle the error --->
        <!--- cfthrow; --->
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24049" access="public" returntype="void">
    <cfargument name="contactID" type="numeric" required="true">
    <cfargument name="tag" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO CONTACTITEMS (CONTACTID, VALUETYPE, VALUECATEGORY, VALUETEXT, ITEMSTATUS) 
            VALUES (
                <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Tags" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.tag#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactItem: #cfcatch.message#">
            <cfthrow message="An error occurred while inserting contact item." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24050" access="public" returntype="void">
    <cfargument name="contactID" type="numeric" required="true">
    <cfargument name="workEmail" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO CONTACTITEMS (CONTACTID, VALUETYPE, VALUECATEGORY, VALUETEXT, ITEMSTATUS)
            VALUES (
                <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Business" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Email" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.workEmail#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactItem: #cfcatch.message# Query: INSERT INTO CONTACTITEMS (CONTACTID, VALUETYPE, VALUECATEGORY, VALUETEXT, ITEMSTATUS) VALUES (#arguments.contactID#, 'Business', 'Email', '#arguments.workEmail#', 'Active')" />
            <cfthrow message="Error inserting contact item." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24051" access="public" returntype="void">
    <cfargument name="contactID" type="numeric" required="true">
    <cfargument name="workPhone" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO CONTACTITEMS (CONTACTID, VALUETYPE, VALUECATEGORY, VALUETEXT, ITEMSTATUS)
            VALUES (
                <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Work" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Phone" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.workPhone#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactItem: #cfcatch.message#">
            <cfthrow message="Error inserting contact item." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24052" access="public" returntype="void">
    <cfargument name="CONTACTID" type="numeric" required="true">
    <cfargument name="Company" type="string" required="true">

        <cfquery result="result" >
            INSERT INTO CONTACTITEMS (CONTACTID, VALUETYPE, VALUECATEGORY, VALUETEXT, ITEMSTATUS) 
            VALUES (
                <cfqueryparam value="#arguments.CONTACTID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Company" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Company" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.Company#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>

</cffunction>
<cffunction name="INScontactitems_24057" access="public" returntype="void">
    <cfargument name="contactID" type="numeric" required="true">
    <cfargument name="company" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO CONTACTITEMS (CONTACTID, VALUETYPE, VALUECATEGORY, valuecompany, ITEMSTATUS)
            VALUES (
                <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Company" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Company" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.company#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error inserting contact item: #cfcatch.message#">
            <cfthrow message="An error occurred while inserting contact item." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24058" access="public" returntype="void">
    <cfargument name="CONTACTID" type="numeric" required="true">
    <cfargument name="Company_new" type="string" required="true">
 
        <cfquery result="result" >
            INSERT INTO CONTACTITEMS (CONTACTID, VALUETYPE, VALUECATEGORY, valuecompany, ITEMSTATUS)
            VALUES (
                <cfqueryparam value="#arguments.CONTACTID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Company" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Company" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.Company_new#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
      
</cffunction>
<cffunction name="SELcontactitems_24064" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT DISTINCT i.valueCompany AS new_valuecompany
            FROM contactitems i
            INNER JOIN contactdetails d ON d.contactid = i.contactid
            WHERE i.VALUEcategory = <cfqueryparam value="company" cfsqltype="CF_SQL_VARCHAR">
            AND d.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            AND i.valuecompany <> ''
            AND i.valueCompany IS NOT NULL
            AND i.valuecompany <> 'Custom'
            ORDER BY i.valuecompany
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDistinctValueCompany: #cfcatch.message#">
            <cfset result = queryNew("new_valuecompany", "varchar")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="DETcontactitems_24168" access="public" returntype="query">
    <cfargument name="itemid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                i.itemid, i.contactid, i.valueType, i.valueCategory, i.valueText, 
                i.valueCompany, i.valueDepartment, i.valueTitle, i.valueStreetAddress, 
                i.valueExtendedAddress, i.valueCity, i.valueRegion, i.itemdate, 
                i.itemnotes, i.itemstatus, i.valueCountry, i.valuePostalCode, 
                c.catid, c.caticon, c.recordname, c.catfieldset
            FROM 
                contactitems i
            INNER JOIN 
                itemcategory c ON c.valuecategory = i.valuecategory
            WHERE 
                i.itemid = <cfqueryparam value="#arguments.itemid#" cfsqltype="cf_sql_integer">
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactItems: #cfcatch.message#">
            <cfthrow message="An error occurred while retrieving contact items." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDcontactitems_24178" access="public" returntype="void">
    <cfargument name="valuetext" type="string" required="false">
    <cfargument name="valuetype" type="string" required="false">
    <cfargument name="catid" type="string" required="true">
    <cfargument name="valuecompany" type="string" required="false" default="">
    <cfargument name="custom" type="string" required="false" default="">
    <cfargument name="valueDepartment" type="string" required="false" default="">
    <cfargument name="valueTitle" type="string" required="false" default="">
    <cfargument name="valueStreetAddress" type="string" required="false" default="">
    <cfargument name="valueExtendedAddress" type="string" required="false" default="">
    <cfargument name="valueCity" type="string" required="false" default="">
    <cfargument name="new_region_id" type="string" required="false" default="">
    <cfargument name="new_countryid" type="string" required="false" default="">
    <cfargument name="valuePostalCode" type="string" required="false" default="">
    <cfargument name="itemdate" type="date" required="false">
    <cfargument name="deleteitem" type="boolean" required="false" default=false>
    <cfargument name="itemid" type="numeric" required="true">

   <cfquery>
    UPDATE contactitems 
    SET 
        <!--- Only include valuetext if provided --->
        <cfif structKeyExists(arguments, "valuetext") and len(trim(arguments.valuetext))>
            valuetext = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.valuetext)#">
        </cfif>

        <!--- Include valuetype if provided --->
        <cfif structKeyExists(arguments, "valuetype") and len(trim(arguments.valuetype))>
            <cfif structKeyExists(arguments, "valuetext") and len(trim(arguments.valuetext))>,</cfif>
            valuetype = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.valuetype)#">
        </cfif>

        <!--- Conditional fields for catid 9 --->
        <cfif arguments.catid eq "9">
       
<cfif structKeyExists(arguments, "valuecompany")>
    <cfif trim(arguments.valuecompany) eq "custom" and trim(arguments.custom) neq "" and trim(arguments.custom) neq "custom">
        , valueCompany = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.custom)#">
    <cfelse>
        , valueCompany = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.valuecompany)#">
    </cfif>
</cfif>

       
         , valueDepartment = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.valueDepartment)#">
            , valueTitle = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.valueTitle)#">
        </cfif>

        <!--- Conditional fields for catid 2 --->
        <cfif arguments.catid eq "2">
            , valueStreetAddress = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.valueStreetAddress)#">
            , valueExtendedAddress = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.valueExtendedAddress)#">
            , valueCity = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.valueCity)#">
            , valueRegion = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.new_region_id)#">
            , valueCountry = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.new_countryid)#">
            , valuePostalCode = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.valuePostalCode)#">
        </cfif>

        <!--- Include itemdate only if provided and valid --->
        <cfif structKeyExists(arguments, "itemdate") and isDate(arguments.itemdate)>
            , itemdate = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.itemdate#">
        </cfif>

        <!--- Set isdeleted if deleteitem is true --->
        <cfif structKeyExists(arguments, "deleteitem") and arguments.deleteitem>
            , isdeleted = 1
        </cfif>

    WHERE itemid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.itemid#">
</cfquery>
</cffunction>

<cffunction name="UPDcontactitems_24179" access="public" returntype="void">
    <cfargument name="valuetype" type="string" required="true">
    <cfargument name="itemid" type="numeric" required="true">

    <cftry>
        <cfquery result="result" >
            UPDATE contactitems 
            SET valuetype = <cfqueryparam value="#arguments.valuetype#" cfsqltype="CF_SQL_VARCHAR">
            WHERE itemid = <cfqueryparam value="#arguments.itemid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error updating contact item: #cfcatch.message# Query: UPDATE contactitems SET valuetype = ? WHERE itemid = ? Parameters: valuetype=#arguments.valuetype#, itemid=#arguments.itemid#">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactitems_24207" access="public" returntype="query">
    <cfargument name="ContactID" type="numeric" required="true">
    <cfargument name="new_tagname" type="string" required="true">

    <cfset var result = "">
 
        <cfquery name="result" >
            SELECT valuetext 
            FROM contactitems 
            WHERE valueCategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR"> 
            AND itemstatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR"> 
            AND contactID = <cfqueryparam value="#arguments.ContactID#" cfsqltype="CF_SQL_INTEGER"> 
            AND valuetext = <cfqueryparam value="#arguments.new_tagname#" cfsqltype="CF_SQL_VARCHAR"> 
            ORDER BY valuetext
        </cfquery>
        
 

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_24313" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT * 
            FROM contactitems 
            WHERE valuecategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR"> 
            AND valuetext = <cfqueryparam value="Casting Director" cfsqltype="CF_SQL_VARCHAR"> 
            AND contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER"> 
            AND itemstatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveCastingDirectors: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_24314" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT *
            FROM contactitems
            WHERE valuecategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR">
            AND contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
            AND itemstatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            AND valuetext IN (
                SELECT tagname AS valuetext
                FROM tags_user
                WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
                AND tagtype = <cfqueryparam value="C" cfsqltype="CF_SQL_CHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getActiveContactTags: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="DELcontactitems" access="public" returntype="void">
    <cfargument name="contactid" type="numeric" required="true">

    <cftry>
        <cfquery result="result" >
            DELETE FROM contactitems
            WHERE valuecategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR">
            AND contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in deleteContactItemsByTag: #cfcatch.message#">
            <cfthrow message="An error occurred while deleting contact items." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24327" access="public" returntype="void">
    <cfargument name="contactID" type="numeric" required="true">
    <cfargument name="newValueText" type="string" required="true">

    <cftry>
        <cfquery result="result" name="insertQuery" >
            INSERT INTO CONTACTITEMS (CONTACTID, VALUETYPE, VALUECATEGORY, VALUETEXT, ITEMSTATUS)
            VALUES (
                <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Tags" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#left(arguments.newValueText, 40)#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactItem: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while inserting contact item." detail="#cfcatch.message#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactitems_24329" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">
    <cfargument name="tagname" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT *
            FROM contactitems
            WHERE valuecategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR">
            AND contactid IN (
                SELECT contactid 
                FROM contactdetails 
                WHERE userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
            )
            AND valueText = <cfqueryparam value="#left(arguments.tagname, 40)#" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactItemsByTag: #cfcatch.message# - Query: #cfcatch.detail#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_24347" access="public" returntype="query">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_tagname" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT * 
            FROM CONTACTITEMS 
            WHERE contactid = <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER"> 
            AND VALUETYPE = <cfqueryparam value="Tags" cfsqltype="CF_SQL_VARCHAR"> 
            AND VALUETEXT = <cfqueryparam value="#arguments.new_tagname#" cfsqltype="CF_SQL_VARCHAR"> 
            AND itemstatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveContactItemsByTag: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="INScontactitems_24348" access="public" returntype="void">
    <cfargument name="new_contactid" type="numeric" required="true">
    <cfargument name="new_tagname" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO CONTACTITEMS (CONTACTID, VALUETYPE, VALUECATEGORY, VALUETEXT, ITEMSTATUS)
            VALUES (
                <cfqueryparam value="#arguments.new_contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Tags" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.new_tagname#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error inserting contact item: #cfcatch.message#">
            <cfthrow message="Error inserting contact item." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="UPDCONTACTITEMS_24349" access="public" returntype="void">
    <cfargument name="itemid" type="numeric" required="true">
    <cfargument name="new_currentStartDate" type="string" required="true">

    <cftry>
        <cfquery result="result" name="updateQuery" >
            UPDATE CONTACTITEMS_tbl 
            SET isdeleted = 1, 
                itemnotes = <cfqueryparam value="Delete via Bulk Update - #arguments.new_currentStartDate#" cfsqltype="CF_SQL_VARCHAR">
            WHERE itemid = <cfqueryparam value="#arguments.itemid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error updating CONTACTITEMS_tbl: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="An error occurred while updating the contact items." detail="#cfcatch.message#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24404" access="public" returntype="void">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="new_tag1" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO contactitems (contactid, valueType, valueCategory, valueText, itemstatus)
            VALUES (
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Tags" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="tag" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.new_tag1#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactItem: #cfcatch.message#; Query: INSERT INTO contactitems (contactid, valueType, valueCategory, valueText, itemstatus) VALUES (#arguments.contactid#, 'Tags', 'tag', '#arguments.new_tag1#', 'Active')">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24406" access="public" returntype="void">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="new_tag2" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO contactitems (contactid, valueType, valueCategory, valueText, itemstatus) 
            VALUES (
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Tags" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="tag" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.new_tag2#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" type="error" text="Error inserting contact item: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24408" access="public" returntype="void" output="false">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="new_tag3" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO contactitems (contactid, valueType, valueCategory, valueText, itemstatus) 
            VALUES (
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Tags" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="tag" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.new_tag3#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactItem: #cfcatch.message# - Query: INSERT INTO contactitems (contactid, valueType, valueCategory, valueText, itemstatus) VALUES (#arguments.contactid#, 'Tags', 'tag', #arguments.new_tag3#, 'Active')">
            <cfthrow message="An error occurred while inserting the contact item." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24410" access="public" returntype="void" hint="Inserts a new contact item into the database.">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="business_email" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO contactitems (contactid, valueType, valueCategory, valueText, itemstatus)
            VALUES (
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Business" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Email" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.business_email#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error inserting contact item: #cfcatch.message#">
            <cfthrow message="An error occurred while inserting the contact item." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24412" access="public" returntype="void">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="personal_email" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO contactitems (contactid, valueType, valueCategory, valueText, itemstatus)
            VALUES (
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Personal" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Email" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.personal_email#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactItem: #cfcatch.message#">
            <cfrethrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24414" access="public" returntype="void">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="work_phone" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO contactitems (contactid, valueType, valueCategory, valueText, itemstatus)
            VALUES (
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Work" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Phone" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.work_phone#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactItem: #cfcatch.message#; Query: INSERT INTO contactitems (contactid, valueType, valueCategory, valueText, itemstatus) VALUES (#arguments.contactid#, 'Work', 'Phone', '#arguments.work_phone#', 'Active')">
            <cfthrow>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24416" access="public" returntype="void">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="mobile_phone" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO contactitems (contactid, valueType, valueCategory, valueText, itemstatus)
            VALUES (
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Mobile" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Phone" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.mobile_phone#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactItem: #cfcatch.message#">
            <cfthrow message="An error occurred while inserting the contact item." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24418" access="public" returntype="void">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="home_phone" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO contactitems (contactid, valueType, valueCategory, valueText, itemstatus)
            VALUES (
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Home" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Phone" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.home_phone#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="Error in insertContactItem: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24420" access="public" returntype="void">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="company" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO contactitems (contactid, valueType, valueCategory, valuecompany, itemstatus)
            VALUES (
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Company" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Company" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.company#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="Error in insertContactItem: #cfcatch.message#">
        <cflog file="application" text="Query Error: #cfcatch.detail#">
        <cflog file="application" text="Parameters: contactid=#arguments.contactid#, company=#arguments.company#">
        <cfthrow message="Database error occurred while inserting contact item.">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24422" access="public" returntype="void">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="website" type="string" required="true">

    <cftry>
        <cfquery result="result" >
            INSERT INTO contactitems (contactid, valueType, valueCategory, valuetext, itemstatus)
            VALUES (
                <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Company Website" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="URL" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.website#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
    <cfcatch type="any">
        <cflog file="application" text="Error inserting contact item: #cfcatch.message#">
        <cfthrow message="Error inserting contact item." detail="#cfcatch.detail#">
    </cfcatch>
    </cftry>
</cffunction>
<cffunction name="INScontactitems_24424" access="public" returntype="void">
    <cfargument name="address" type="struct" required="true">

    <cfset var queryResult = "">
    
    <cftry>
        <cfquery result="result" name="queryResult" >
            INSERT INTO contactitems (
                contactid, 
                valueType, 
                valueCategory, 
                valuestreetaddress, 
                valueextendedaddress, 
                valuecity, 
                valueregion, 
                valuepostalcode, 
                valuecountry, 
                itemstatus
            ) VALUES (
                <cfqueryparam value="#arguments.address.contactid#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Work" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Address" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.address.address#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.address.address_second#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.address.city#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.address.state#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.address.zip#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.address.country#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            )
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in insertContactItem: #cfcatch.message# Query: #cfcatch.detail#">
            <cfthrow message="Database error occurred while inserting contact item." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactitems_24620" access="public" returntype="query">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                ci.contactid AS id, 
                concat(c.recordname, ' (', ti.tagname, ')') AS name
            FROM 
                contactitems ci
            INNER JOIN 
                contactdetails c ON c.contactid = ci.contactid
            INNER JOIN 
                tags_user ti ON ti.tagname = ci.valuetext
            WHERE 
                ci.valuecategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR"> 
                AND ti.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND c.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND ti.IsCasting = <cfqueryparam value="1" cfsqltype="CF_SQL_BIT">
            ORDER BY 
                c.recordname
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactItemsWithTags: #cfcatch.message# Query: SELECT ci.contactid AS id, concat(c.recordname, ' (', ti.tagname, ')') AS name FROM contactitems ci INNER JOIN contactdetails c ON c.contactid = ci.contactid INNER JOIN tags_user ti ON ti.tagname = ci.valuetext WHERE ci.valuecategory = 'Tag' AND ti.userid = #arguments.userid# AND c.userid = #arguments.userid# AND ti.IsCasting = 1 ORDER BY c.recordname">
            <cfthrow message="An error occurred while retrieving contact items with tags." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="SELcontactitems_24657" access="public" returntype="query">
    <cfargument name="currentid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT valueText AS email
            FROM contactitems
            WHERE valueCategory = <cfqueryparam value="Email" cfsqltype="CF_SQL_VARCHAR">
            AND contactID = <cfqueryparam value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER">
            AND itemstatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR">
            ORDER BY primary_yn DESC
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveEmails: #cfcatch.message#; Query: SELECT valueText AS email FROM contactitems WHERE valueCategory = 'Email' AND contactID = #arguments.currentid# AND itemstatus = 'Active' ORDER BY primary_yn DESC;">
            <cfset result = queryNew("email")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_24663" access="public" returntype="query">
    <cfargument name="currentid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT i.valueCompany 
            FROM contactitems i 
            INNER JOIN itemcategory c ON c.valueCategory = i.valuecategory 
            WHERE i.contactID = <cfqueryparam value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER"> 
            AND c.valuecategory = <cfqueryparam value="Company" cfsqltype="CF_SQL_VARCHAR"> 
            AND i.itemstatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR"> 
            AND i.valuecompany <> '' 
            AND i.valuecompany IS NOT null 
            ORDER BY i.valuetext 
            LIMIT 1
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveCompany: #cfcatch.message# - Query: SELECT i.valueCompany FROM contactitems i INNER JOIN itemcategory c ON c.valueCategory = i.valuecategory WHERE i.contactID = ? AND c.valuecategory = 'Company' AND i.itemstatus = 'Active' AND i.valuecompany <> '' AND i.valuecompany IS NOT null ORDER BY i.valuetext LIMIT 1">
            <cfreturn queryNew("valueCompany")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_24671" access="public" returntype="query">
    <cfargument name="contactID" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                i.itemID, 
                i.valueType, 
                i.valueCategory, 
                i.valuetext, 
                i.valuecompany, 
                i.valuedepartment, 
                i.valuetitle, 
                i.valueStreetAddress, 
                i.valueExtendedAddress, 
                i.valueCity, 
                i.valueRegion, 
                i.itemDate, 
                i.itemNotes, 
                i.itemStatus, 
                i.itemCreationDate, 
                i.itemLastUpdated, 
                i.valueCountry, 
                c.caticon
            FROM contactitems i
            INNER JOIN itemcategory c ON c.valueCategory = i.valuecategory
            WHERE i.contactID = <cfqueryparam value="#arguments.contactID#" cfsqltype="CF_SQL_INTEGER">
            AND i.valuetext <> ''
            AND i.itemStatus = 'Active'
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveContactItems: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_24672" access="public" returntype="query">
    <cfargument name="currentid" type="numeric" required="true">
    <cfargument name="catArea_UCB" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                i.itemID, i.valueType, i.valueCategory, i.valuetext, 
                i.valuecompany, i.valuedepartment, i.valuetitle, 
                i.valueStreetAddress, i.valueExtendedAddress, 
                i.valuePostalCode, i.valueCity, i.valueRegion, 
                i.itemDate, i.itemNotes, i.itemStatus, 
                i.itemCreationDate, i.itemLastUpdated, 
                i.valueCountry, c.caticon, c.catSelectList, c.catfieldset
            FROM 
                contactitems i
            INNER JOIN 
                itemcategory c ON c.valueCategory = i.valuecategory
            WHERE 
                i.contactID = <cfqueryparam value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER"> 
                AND c.catArea_UCB IN ('B', <cfqueryparam value="#arguments.catArea_UCB#" cfsqltype="CF_SQL_VARCHAR">)
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactItems: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_24673" access="public" returntype="query">
    <cfargument name="currentid" type="numeric" required="true">
    <cfargument name="activeCategoriesValueCategory" type="string" required="true">
    <cfargument name="catArea_UCB" type="string" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                i.itemID, i.valueType, i.valueCategory, i.valuetext, i.valueCompany, 
                i.valuedepartment, i.valuetitle, i.valueStreetAddress, i.valueExtendedAddress, 
                i.valueCity, i.valueRegion, i.itemDate, i.itemNotes, i.itemStatus, 
                i.itemCreationDate, i.itemLastUpdated, i.valueCountry, c.catfieldset, 
                c.caticon, i.valuepostalcode, i.primary_yn
            FROM 
                contactitems i
            INNER JOIN 
                itemcategory c ON c.valueCategory = i.valuecategory
            WHERE 
                i.contactID = <cfqueryparam value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER"> 
                AND c.valuecategory = <cfqueryparam value="#arguments.activeCategoriesValueCategory#" cfsqltype="CF_SQL_VARCHAR"> 
                AND i.itemstatus = <cfqueryparam value='Active' cfsqltype='CF_SQL_VARCHAR'> 
                AND i.valuecategory <> 'Tag' 
                AND c.catArea_UCB IN ('B', <cfqueryparam value="#arguments.catArea_UCB#" cfsqltype="CF_SQL_VARCHAR">)
            ORDER BY 
                i.valuetext
        </cfquery>
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getActiveContactItems: #cfcatch.message#">
            <cfset result = queryNew("itemID,valueType,valueCategory,valuetext,valueCompany,valuedepartment,valuetitle,valueStreetAddress,valueExtendedAddress,valueCity,valueRegion,itemDate,itemNotes,itemStatus,itemCreationDate,itemLastUpdated,valueCountry,catfieldset,caticon,valuepostalcode,primary_yn")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_24682" access="public" returntype="query">
    <cfargument name="userContactID" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                i.valuetext, 
                i.valuetype, 
                t.typeIcon, 
                i.valuecategory 
            FROM 
                contactitems i 
            INNER JOIN 
                itemtypes t ON i.valueType = t.valueType 
            WHERE 
                i.valueCategory IN (<cfqueryparam value="Acting Links" cfsqltype="CF_SQL_VARCHAR">, <cfqueryparam value="Profile" cfsqltype="CF_SQL_VARCHAR">) 
                AND i.itemstatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR"> 
                AND i.contactid = <cfqueryparam value="#arguments.userContactID#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                i.valuetype
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getContactItems: #cfcatch.message#">
            <cfset result = queryNew("valuetext, valuetype, typeIcon, valuecategory")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_24714" access="public" returntype="query">
    <cfargument name="currentid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT valueText as phonenumber 
            FROM contactitems 
            WHERE valueCategory = <cfqueryparam value="Phone" cfsqltype="CF_SQL_VARCHAR"> 
            AND contactID = <cfqueryparam value="#arguments.currentid#" cfsqltype="CF_SQL_INTEGER"> 
            AND itemstatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR"> 
            ORDER BY primary_yn DESC
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActivePhoneNumbers: #cfcatch.message#">
            <cfset result = queryNew("phonenumber", "varchar")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_24715" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="true">
    <cfargument name="userid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                i.valuetext, 
                i.valuetype, 
                t.typeIcon 
            FROM 
                contactitems i 
            INNER JOIN 
                itemtypes_user t 
            ON 
                i.valueType = t.valueType 
            WHERE 
                i.valueCategory = <cfqueryparam value="Social Profile" cfsqltype="CF_SQL_VARCHAR"> 
                AND i.contactID = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER"> 
                AND i.itemstatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR"> 
                AND t.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getSocialProfileItems: #cfcatch.message#">
            <cfreturn queryNew("valuetext, valuetype, typeIcon")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="DETcontactitems_24719" access="public" returntype="query">
    <cfargument name="itemid" type="numeric" required="true">

    <cfset var queryResult = "">
    
    <cftry>
        <cfquery result="result" name="queryResult" >
            SELECT 
                i.itemid, i.contactid, i.valueType, i.valueCategory, i.valueText, 
                i.valueCompany, i.valueDepartment, i.valueTitle, i.valueStreetAddress, 
                i.valueExtendedAddress, i.valueCity, i.valueRegion, i.itemdate, 
                i.itemnotes, i.itemstatus, i.valueCountry, i.valuePostalCode, 
                c.catid, c.caticon, c.recordname, c.catfieldset 
            FROM 
                contactitems i 
            INNER JOIN 
                itemcategory c ON c.valuecategory = i.valuecategory 
            WHERE 
                i.itemid = <cfqueryparam value="#arguments.itemid#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>

        <cfcatch type="any">
            <cflog file="application" text="Error in getContactItemDetails: #cfcatch.message#">
            <cfthrow message="An error occurred while fetching contact item details." detail="#cfcatch.detail#">
        </cfcatch>
    </cftry>

    <cfreturn queryResult>
</cffunction>
<cffunction name="SELcontactitems_24761" access="public" returntype="query">
    <cfargument name="contactid" type="numeric" required="true">
    <cfset var result = "">
    <cftry>
        <cfquery name="result" >
            SELECT * 
            FROM contactitems 
            WHERE valuecategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR"> 
            AND contactid = <cfqueryparam value="#arguments.contactid#" cfsqltype="CF_SQL_INTEGER"> 
            AND itemstatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR"> 
            AND valuetext IN (
                SELECT tagname AS valuetext 
                FROM tags_user 
                WHERE userid = <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_INTEGER"> 
                AND tagtype = <cfqueryparam value="C" cfsqltype="CF_SQL_CHAR">
            )
        </cfquery>
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveContactTags: #cfcatch.message#">
            <cfset result = queryNew("")>
        </cfcatch>
    </cftry>
    <cfreturn result>
</cffunction>
<cffunction name="SELcontactitems_24764" access="public" returntype="query">
    <cfargument name="ContactID" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" >
            SELECT 
                CONCAT("<span class='badge badge-blue' style='font-size: 12px; font-weight: 500;'>", valueText, "</span>") AS valuetext, 
                valuetext AS tag 
            FROM 
                contactitems 
            WHERE 
                valueCategory = <cfqueryparam value="Tag" cfsqltype="CF_SQL_VARCHAR"> 
                AND itemstatus = <cfqueryparam value="Active" cfsqltype="CF_SQL_VARCHAR"> 
                AND contactID = <cfqueryparam value="#Arguments.ContactID#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                valuetext
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getActiveContactTags: #cfcatch.message#">
            <cfset result = queryNew("valuetext, tag")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction></cfcomponent>
