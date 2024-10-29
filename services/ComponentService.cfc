<cfcomponent displayname="ComponentService" hint="Handles operations for Component table" output="false"> 
<cffunction name="getFilteredPgComps" access="public" returntype="query">
    <cfargument name="menuYN" type="string" required="true">
    <cfargument name="compOwner" type="string" required="true">
    <cfargument name="appid" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
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
                AND c.appid <> <cfqueryparam value="#arguments.appid#" cfsqltype="CF_SQL_INTEGER"> 
            ORDER BY 
                c.menuOrder
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="errorLog" text="Error in getFilteredPgComps: #cfcatch.message#">
            <cfreturn queryNew("compID, compName, compIcon, compOwner, menuYN, compDir, menuOrder")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="getFilteredComps" access="public" returntype="query">
    <cfargument name="menuYN" type="string" required="true">
    <cfargument name="compOwner" type="string" required="true">
    <cfargument name="appId" type="numeric" required="true">

    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="yourDataSource">
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
<cfscript>
function getPgComps(appID, compOwner) {
    var result = "";
    try {
        if (isNumeric(appID) && len(compOwner)) {
            var query = new Query();
            query.setDatasource("abod");
            query.setSQL("
                SELECT c.compID, c.compName, c.compIcon, c.compOwner, c.menuYN, c.compDir, c.menuOrder 
                FROM pgcomps c 
                WHERE c.menuYN = 'Y' AND compOwner = ? AND c.appid = ? 
                ORDER BY c.menuOrder
            ");
            query.addParam(name="compOwner", value=compOwner, cfsqltype="CF_SQL_CHAR");
            query.addParam(name="appID", value=appID, cfsqltype="CF_SQL_INTEGER");
            result = query.execute().getResult();
        } else {
            result = queryNew("compID,compName,compIcon,compOwner,menuYN,compDir,menuOrder");
        }
    } catch (any e) {
        cflog(file="errorLog", text="Error in getPgComps: " & e.message);
    }
    return result;
}
</cfscript>
</cfcomponent>
