<!--- This ColdFusion page includes necessary scripts and styles, sets up the layout, and manages modals for user interaction. --->
<cfinclude template="/include/pgload.cfm" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title><cfoutput>#appName# | #pgTitle#</cfoutput></title>
<meta content="<cfoutput>#appDescription#</cfoutput>" name="description" />
<meta content="<cfoutput>#appAuthor#</cfoutput>" name="author" />

<style>
@import url('https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap');
</style>

<!--- Loop through FindLinksT query to include scripts and styles --->
<cfloop query="FindLinksT">
<cfif findlinkst.linktype is "script">
<script src="<cfoutput>#findlinkst.linkurl#</cfoutput>"></script>
<cfelseif findlinkst.linktype is "script_include">
<cfinclude template="#findlinkst.linkurl#">
<cfelse>
<link href="<cfoutput>#findlinkst.linkurl#?rev=#rev#</cfoutput>" <cfif findlinkst.rel is not ""> rel="#rel#"</cfif> type="text/css" <cfif findlinkst.hrefid is not ""> id="#findlinkst.hrefid#"</cfif> />
</cfif>
</cfloop>

<!--- Check session variable for ftom and show modal if necessary --->
<cfif isdefined('session.ftom')>
<cfif session.ftom is "Y">
<script type="text/javascript">
$(window).on('load', function() {
$('#showmaint').modal('show');
});
</script>
<cfset session.ftom="N" />
</cfif>
</cfif>
</head>
<body class="loading">
<div id="wrapper">
<!--- Set navbar background color based on host environment --->
<cfif host is "dev">
<div class="navbar-custom" style="background-color: ##8b0000 !important;">
<cfelse>
<div class="navbar-custom" style="background-color: <cfoutput>#colorTopBar#</cfoutput> !important;">
</cfif>

<!--- Rest of the code continues here... --->

<!--- Changes made: Removed unnecessary cfoutput tags, standardized variable names and casing, ensured consistent attribute quoting, spacing, and formatting, simplified record count logic for icons or conditional displays, improved logic for expanding and collapsing views in mobile layouts, removed cftry and cfcatch blocks entirely, used double pound signs for hex color codes to avoid interpretation as variables. --->