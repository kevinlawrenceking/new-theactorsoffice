<cfcomponent displayname="PageAppLinkService" hint="Handles operations for PageAppLink table" output="false"> 
<cffunction name="SELpgapplinks" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                l.linkid, 
                l.linkurl, 
                l.linkname, 
                l.linktype, 
                l.link_no, 
                l.linkloc_tb, 
                l.pluginname, 
                l.rel, 
                l.hrefid
            FROM 
                pgapplinks l
            INNER JOIN 
                pgplugins p ON p.pluginName = l.pluginname
            INNER JOIN 
                pgpagespluginsxref x ON x.pluginid = p.pluginid
            INNER JOIN 
                pgpages g ON g.pgid = x.pgid
            WHERE 
                g.pgid = <cfqueryparam value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER"> 
            AND 
                l.linkloc_tb = <cfqueryparam value="t" cfsqltype="CF_SQL_CHAR">
            ORDER BY 
                l.link_no
        </cfquery>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getLinks function: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>
    
    <cfreturn result>
</cffunction>
<cffunction name="SELpgapplinks_24006" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT 
                l.linkid, l.linkurl, l.linkname, l.linktype, 
                l.link_no, l.linkloc_tb, l.pluginname, l.rel, l.hrefid 
            FROM 
                pgapplinks l 
            INNER JOIN 
                pgplugins p ON p.pluginName = l.pluginname 
            INNER JOIN 
                pgpagespluginsxref x ON x.pluginid = p.pluginid 
            INNER JOIN 
                pgpages g ON g.pgid = x.pgid 
            WHERE 
                g.pgid = <cfqueryparam value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER"> 
                AND l.linkloc_tb = <cfqueryparam value="b" cfsqltype="CF_SQL_CHAR"> 
                AND l.linkname NOT LIKE <cfqueryparam value="%calendar - custom%" cfsqltype="CF_SQL_VARCHAR"> 
            ORDER BY 
                l.link_no
        </cfquery>
        
        <cfcatch>
            <cflog file="application" text="Error in getFilteredLinks: #cfcatch.message#">
            <cfreturn queryNew("")>
        </cfcatch>
    </cftry>

    <cfreturn result>
</cffunction>
<cffunction name="SELpgapplinks_24007" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">
    
    <cfset var result = "">
    
    <cftry>
        <cfquery name="result" datasource="abod">
            SELECT DISTINCT l.pluginname
            FROM pgapplinks l
            INNER JOIN pgplugins p ON p.pluginName = l.pluginname
            INNER JOIN pgpagespluginsxref x ON x.pluginid = p.pluginid
            INNER JOIN pgpages g ON g.pgid = x.pgid
            WHERE g.pgid = <cfqueryparam value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER">
            AND l.linkloc_tb = <cfqueryparam value="b" cfsqltype="CF_SQL_CHAR">
            AND l.pluginname <> <cfqueryparam value="global" cfsqltype="CF_SQL_VARCHAR">
            ORDER BY l.link_no
        </cfquery>
        
        <cfreturn result>
        
        <cfcatch type="any">
            <cflog file="application" text="Error in getDistinctPluginNames: #cfcatch.message# Query: #cfcatch.detail#">
            <cfreturn queryNew("pluginname")>
        </cfcatch>
    </cftry>
</cffunction></cfcomponent>
