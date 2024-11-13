<cfcomponent displayname="PageAppLinkService" hint="Handles operations for PageAppLink table" output="false"> 
<cffunction name="SELpgapplinks" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">
    <cfset var result = "">

    <cfquery name="result">
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
            g.pgid = <cfquery result="result" param value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER"> 
        AND 
            l.linkloc_tb = <cfquery result="result" param value="t" cfsqltype="CF_SQL_CHAR">
        ORDER BY 
            l.link_no
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELpgapplinks_24006" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">
    <cfset var result = "">

    <cfquery name="result">
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
            g.pgid = <cfquery result="result" param value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER"> 
            AND l.linkloc_tb = <cfquery result="result" param value="b" cfsqltype="CF_SQL_CHAR"> 
            AND l.linkname NOT LIKE <cfquery result="result" param value="%calendar - custom%" cfsqltype="CF_SQL_VARCHAR"> 
        ORDER BY 
            l.link_no
    </cfquery>

    <cfreturn result>
</cffunction>

<cffunction name="SELpgapplinks_24007" access="public" returntype="query">
    <cfargument name="pgid" type="numeric" required="true">
    
    <cfset var result = "">

    <cfquery name="result">
        SELECT DISTINCT l.pluginname
        FROM pgapplinks l
        INNER JOIN pgplugins p ON p.pluginName = l.pluginname
        INNER JOIN pgpagespluginsxref x ON x.pluginid = p.pluginid
        INNER JOIN pgpages g ON g.pgid = x.pgid
        WHERE g.pgid = <cfquery result="result" param value="#arguments.pgid#" cfsqltype="CF_SQL_INTEGER">
        AND l.linkloc_tb = <cfquery result="result" param value="b" cfsqltype="CF_SQL_CHAR">
        AND l.pluginname <> <cfquery result="result" param value="global" cfsqltype="CF_SQL_VARCHAR">
        ORDER BY l.link_no
    </cfquery>

    <cfreturn result>
</cffunction></cfcomponent>