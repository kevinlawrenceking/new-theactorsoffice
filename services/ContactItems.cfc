<cfcomponent displayname="ContactItems" output="false" hint="Service to handle contact items related queries">

    <!--- Function to retrieve active categories --->
    <cffunction name="getActiveCategories" access="remote" returntype="query" output="false" hint="Get a list of active categories.">
        <cfquery name="ActiveCategories">
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
        <cfquery name="InactiveCategories">
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

</cfcomponent>
