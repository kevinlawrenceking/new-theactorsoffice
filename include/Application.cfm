<cfscript>
    // Get the first part of the server name (subdomain)
    host = ListFirst(cgi.server_name, ".");

    // Determine the datasource based on the host
    if (host == "app" || host == "uat") {
        datasourceName = "abo";
        dsn = "abo";
    } else {
        datasourceName = "abod";
        dsn = "abod";
    }
</cfscript>

<!--- Now use the dynamically determined datasource in the cfapplication tag  --->
<cfapplication 
    name="TAO_dev" 
    sessionmanagement="true" 
    applicationtimeout="#createTimeSpan(1, 0, 0, 0)#" 
    sessiontimeout="#createTimeSpan(0, 1, 0, 0)#" 
    datasource="#datasourceName#"
    setclientcookies="true"
>

<cfinclude template="/include/fetchUsers.cfm" />

