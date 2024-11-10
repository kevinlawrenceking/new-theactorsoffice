<cfparam name="timeTitle" default="" />
<cfparam name="pgAction" default="view" />
<cfparam name="subDomain" default="app" />
<cfparam name="thisPage2" default="" />
<cfparam name="rpgId" default="0" />
<cfparam name="userContactId" default="0" />
<cfparam name="catAreaUCB" default="C" />
<cfparam name="contactId" default="0" />
<cfparam name="userId" default="#session.userId#" />
<cfparam name="browserContactAvatarFilename" default="#session.userAvatarUrl#" />

<cfscript>
    currentURL = cgi.server_name;
    host = ListFirst(currentURL, ".");
    thisPath = ExpandPath("*.*");
    thisDirectory = GetDirectoryFromPath(thisPath);
    thisPage = ListLast(thisDirectory, "\");
    currentPage = cgi.script_name & "?" & cgi.query_string;
    returnPage = cgi.script_name & "?" & cgi.query_string;
</cfscript>

<cfinclude template="/include/toast.cfm" />

<cfif isDefined('dn')>
    <cfinclude template="/include/qry/update_187_1.cfm" />
</cfif>

<cfif isDefined('ca') AND ca EQ "Y">
    <cfinclude template="/include/qry/update_187_2.cfm" />
    <cfset StructDelete(Variables, "ca") />
</cfif>

<cfset calRootDir = session.userCalendarPath />
<cfset calRootUrl = session.userCalendarURL />

<cfset cookie.userId = userId />

<cfinclude template="/include/fetchUsers.cfm" />
<cfinclude template="/include/fetchPageService.cfm" />

<cfif pgFilename NEQ "">
    <cfset filePath = expandPath("/include/qry/#pgFilename#")>
    <cfif fileExists(filePath)>
        <cfinclude template="/include/qry/#pgFilename#" />
    </cfif>
</cfif>

<!--- Changes: Standardized variable names and casing (Rule 5), Removed unnecessary `<cfoutput>` tags around variable outputs (Rule 2), Ensured consistent attribute quoting, spacing, and formatting (Rule 6) --->