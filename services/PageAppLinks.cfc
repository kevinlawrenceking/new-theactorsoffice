<cfcomponent displayname="PageAppLinks" output="false">



    <!--- Function to fetch application links based on a page ID --->
    <cffunction name="GetPageAppLinks" access="public" returntype="query" output="false">
        <cfargument name="pgid" type="numeric" required="yes">

        <cfquery name="FindLinksT" >
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
                g.pgid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.pgid#"> 
                AND l.linkloc_tb = 't' 
            ORDER BY 
                l.link_no
        </cfquery>

        <cfreturn FindLinksT>
    </cffunction>

</cfcomponent>
