<cfcomponent displayname="ComponentService" hint="Handles operations for Component table" > 
<cffunction output="false" name="SELpgcomps" access="public" returntype="query">
    <cfargument name="menuYN" type="string" required="true">
    <cfargument name="compOwner" type="string" required="true">
    <cfargument name="appid" type="string" required="true">

    
 
        <cfquery name="result">
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

<cffunction output="false" name="getPgComps" access="public" returntype="query">
    <cfargument name="appID" type="numeric" required="true">
    <cfargument name="compOwner" type="string" required="true">

    

        <cfif isNumeric(arguments.appID) AND len(arguments.compOwner)>
            <cfquery name="result">
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
            
        </cfif>

    <cfreturn result>
</cffunction>

</cfcomponent>