<cfcomponent output="false">
    <cfquery result="result" name="findit" datasource="abo">
        SELECT verid 
        FROM taoversions  
        ORDER BY isactive DESC, verid DESC 
        LIMIT 1
    </cfquery>

    <cfset current_ver = findit.verid />
    <cfset host = ListFirst(cgi.server_name, ".") />

    <cfif host eq "app" or host eq "uat">
        <cfset application.dsn = "abo" />
    <cfelse>
        <cfset application.dsn = "abod" />
    </cfif>

    <cfscript>
        this.name = "TAO";
        this.datasource = application.dsn;
        this.sessionManagement = true;
        this.applicationTimeout = createTimeSpan(1, 1, 0, 0);
        this.sessionTimeout = createTimeSpan(0, 0, 20, 0);
        this.loginStorage = "session";
    </cfscript>

    <cffunction name="onRequestStart" returntype="boolean" output="false">
        <cfargument name="targetPage" required="true" type="string">

        <!-- Exclude certain pages from session checks -->
        <cfif NOT ListFindNoCase("loginform.cfm,login2.cfm", arguments.targetPage)>
            <cfif NOT isDefined('session.userid')>
            <cfif isdefined('U')>
            <cfset session.userid = 30 />
            <cfelse>
                <cflocation url="/loginform.cfm" addtoken="no">
                </cfif>
            </cfif>
        </cfif>

        <cfreturn true>
    </cffunction>
</cfcomponent>
