<cfcomponent displayname="ComponentService" hint="Handles operations for Component table" output="false"> 
<cffunction name="SELpgcomps" access="public" returntype="query">
    <cfargument name="menuYN" type="string" required="true">
    <cfargument name="compOwner" type="string" required="true">
    <cfargument name="appid" type="string" required="true">

    <cfset var result = "">
 
        <cfquery name="result" datasource="abod">
            SELECT 
                c.compID, 
                c.compName, 
                c.compIcon, 
                c.compOwner, 
                c.menuYN, 
                c.compDir, 
                c.menuOrder 
            FROM 
                pgcomps c 
            WHERE 
                c.menuYN = <cfqueryparam value="#arguments.menuYN#" cfsqltype="CF_SQL_CHAR"> 
                AND c.compOwner = <cfqueryparam value="#arguments.compOwner#" cfsqltype="CF_SQL_CHAR"> 
            AND c.appid IN (<cfqueryparam value="#arguments.appid#" cfsqltype="CF_SQL_VARCHAR">) 

            ORDER BY 
                c.menuOrder
        </cfquery>
 

    <cfreturn result>
</cffunction>
<cffunction name="SELpgcomps_24680" access="public" returntype="query">
    <cfargument name="menuYN" type="string" required="true">
    <cfargument name="compOwner" type="string" required="true">
    <cfargument name="appId" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                c.compID, 
                c.compName, 
                c.compIcon, 
                c.compOwner, 
                c.menuYN, 
                c.compDir, 
                c.menuOrder
            FROM 
                pgcomps c
            WHERE 
                c.menuYN = <cfqueryparam value="#arguments.menuYN#" cfsqltype="CF_SQL_CHAR"> 
                AND c.compOwner = <cfqueryparam value="#arguments.compOwner#" cfsqltype="CF_SQL_CHAR"> 
                AND c.appid <> <cfqueryparam value="#arguments.appId#" cfsqltype="CF_SQL_INTEGER">
            ORDER BY 
                c.menuOrder
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getFilteredComps: #cfcatch.message# Query: SELECT c.compID, c.compName, c.compIcon, c.compOwner, c.menuYN, c.compDir, c.menuOrder FROM pgcomps WHERE menuYN = ? AND compOwner = ? AND appid <> ? ORDER BY menuOrder Parameters: menuYN=#arguments.menuYN#, compOwner=#arguments.compOwner#, appId=#arguments.appId#">
            <cfreturn queryNew("compID,compName,compIcon,compOwner,menuYN,compDir,menuOrder")>
        </cfcatch>
    </cftry>
</cffunction>
<cffunction name="getPgComps" access="public" returntype="query">
    <cfargument name="appID" type="numeric" required="true">
    <cfargument name="compOwner" type="string" required="true">

    <cfset var result = "">

 
        <cfif isNumeric(arguments.appID) AND len(arguments.compOwner)>
            <cfquery name="result" datasource="abod">
                SELECT 
                    c.compID, 
                    c.compName, 
                    c.compIcon, 
                    c.compOwner, 
                    c.menuYN, 
                    c.compDir, 
                    c.menuOrder 
                FROM 
                    pgcomps c 
                WHERE 
                    c.menuYN = 'Y' 
                    AND c.compOwner = <cfqueryparam value="#arguments.compOwner#" cfsqltype="CF_SQL_CHAR"> 
                    AND c.appid = <cfqueryparam value="#arguments.appID#" cfsqltype="CF_SQL_INTEGER"> 
                ORDER BY 
                    c.menuOrder
            </cfquery>
        <cfelse>
            <cfset result = queryNew("compID,compName,compIcon,compOwner,menuYN,compDir,menuOrder")>
        </cfif>

 
    <cfreturn result>
</cffunction>

</cfcomponent>
