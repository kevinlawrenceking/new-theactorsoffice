<cfcomponent displayname="PageAppLinks" output="false">

    <cffunction name="GetPageAppLinks" access="public" returntype="query" output="false">
        <cfargument name="pgid" type="numeric" required="yes">

        <cfquery result="result"  name="FindLinksT">
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
                INNER JOIN pgplugins p ON p.pluginName = l.pluginname 
                INNER JOIN pgpagespluginsxref x ON x.pluginid = p.pluginid 
                INNER JOIN pgpages g ON g.pgid = x.pgid 
            WHERE 
                g.pgid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.pgid#"> 
                AND l.linkloc_tb = 't' 
            ORDER BY 
                l.link_no
        </cfquery>

        <cfreturn FindLinksT>
    </cffunction>

    <cffunction name="GetLinksForPageB" access="public" returntype="query" output="false">
        <cfargument name="pgid" type="numeric" required="true">

        <cfquery name="result">
            SELECT
                l.linkid, l.linkurl, l.linkname, l.linktype,
                l.link_no, l.linkloc_tb, l.pluginname,
                l.rel, l.hrefid
            FROM pgapplinks l
            INNER JOIN pgplugins p ON p.pluginName = l.pluginname
            INNER JOIN pgpagespluginsxref x ON x.pluginid = p.pluginid
            INNER JOIN pgpages g ON g.pgid = x.pgid
            WHERE g.pgid = <cfquery result="result" param cfsqltype="CF_SQL_INTEGER" value="#arguments.pgid#">
              AND l.linkloc_tb = 'b'
              AND l.linkname NOT LIKE '%calendar - custom%'
              AND l.linktype <> 'css'
            ORDER BY l.link_no
        </cfquery>

        <cfreturn result>
    </cffunction>

</cfcomponent>