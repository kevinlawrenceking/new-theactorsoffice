<cfcomponent displayname="DashboardsService" output="false" hint="Handles business logic for retrieving user dashboards.">

    <!-- Existing function -->
    <cffunction name="getDashboardsByUserId" access="public" returntype="query" output="false" hint="Fetch dashboard panels for a specific user">
        <cfargument name="userid" type="numeric" required="true" hint="The ID of the user for whom to retrieve dashboards">
        
        <cfquery name="dashboards">
            SELECT 
                p.pnid, 
                p.pntitle, 
                p.pnColXl, 
                p.pnColMd, 
                p.pnFilename, 
                p.pnorderno as new_pnorderno
            FROM 
                pgpanels_user p 
            WHERE 
                p.userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer">
                AND p.isvisible = 1
            ORDER BY 
                p.pnorderno
        </cfquery>
        
        <cfreturn dashboards>
    </cffunction>

    <!-- New function to get a single panel by pnid -->
    <cffunction name="getDashboardByPnId" access="public" returntype="query" output="false" hint="Fetch a specific dashboard panel by pnid">
        <cfargument name="pnid" type="numeric" required="true" hint="The ID of the panel to retrieve">
        
        <cfquery name="dashboard">
            SELECT 
                p.pnid, 
                p.pntitle, 
                p.pnColXl, 
                p.pnColMd, 
                p.pnFilename, 
                p.pnorderno as new_pnorderno
            FROM 
                pgpanels_user p
            WHERE 
                p.pnid = <cfqueryparam value="#arguments.pnid#" cfsqltype="cf_sql_integer">
                AND p.isvisible = 1
        </cfquery>
        
        <cfreturn dashboard>
    </cffunction>

</cfcomponent>

