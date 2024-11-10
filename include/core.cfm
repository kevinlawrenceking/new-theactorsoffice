<cfinclude template="/include/qry/menuitems.cfm">
<cfinclude template="/include/qry/menuItemsA_496_2.cfm">
<cfinclude template="/include/qry/menuItemsAud_496_3.cfm">
<cfinclude template="/include/pgload.cfm" />
<cfparam name="deviceType" default="Unknown" />
<cfset deviceType="Desktop" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title><cfoutput>#appName# | #pgTitle#</cfoutput></title>
<meta content="<cfoutput>#appDescription#</cfoutput>" name="description" />
<meta content="<cfoutput>#appAuthor#</cfoutput>" name="author" />
<meta name="robots" content="noindex">
<cfinclude template="/include/qry/FindLinksT.cfm" />
<cfinclude template="/include/qry/FindLinksB.cfm" />
<cfset rev="13" />
<cfloop query="FindLinksT">
    <cfif findlinkst.linktype is "script">
        <script src="<cfoutput>#findlinkst.linkurl#?ver=#rev#.4</cfoutput>"></script>
    <cfelseif findlinkst.linktype is "script_include">
        <cfinclude template="<cfoutput>#findlinkst.linkurl#?ver=#rev#.4.1</cfoutput>">
    <cfelse>
        <link href="<cfoutput>#findlinkst.linkurl#?ver=#rev#.3.1.2</cfoutput>" 
            <cfif len(findlinkst.rel)>rel="<cfoutput>#rel#</cfoutput>" </cfif>
            type="text/css" 
            <cfif len(findlinkst.hrefid)>id="<cfoutput>#findlinkst.hrefid#</cfoutput>"</cfif> />
    </cfif>
</cfloop>
<style>
body.authentication-bg {
    background-color: <cfoutput>#hostcolor#</cfoutput>;
    background-size: cover;
    background-position: center;
}
.navbar-custom {
    background-color: <cfoutput>#hostcolor#</cfoutput>;
}
</style>
</head>
<body style="overflow-y: scroll!important;">
<div id="wrapper">
<cfinclude template="/include/topbar.cfm" />
<cfinclude template="/include/leftbar.cfm" />
<div class="content-page">
<div class="content">
<!--- Start Content --->
<div class="container-fluid">
<!--- Start Page Title --->
<div class="row">
<cfif pgid is "17599999">
<cfinclude template="/include/core_title_175.cfm" />
<CFELSE>
<cfinclude template="/include/core_title.cfm" />
</cfif>
</div>
<cfif len(pgFilename)>
<cfinclude template="/include/<cfoutput>#pgFilename#</cfoutput>" />
</cfif>
</div>
</div>
<cfinclude template="/include/footer.cfm" />
</div>
</div>
<cfparam name="pgDir" default="" />
<cfparam name="pgId" default="0" />

<!--- Modal for Support Center --->
<div id="z" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header" style="background-color: #f3f7f9;">
<h4 class="modal-title" id="standard-modalLabel">Support Center</h4>
<button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true"></button>
</div>
<div class="modal-body">
Click icon on the bottom right of the TAO program window
</div>
</div>
</div>
</div>

<script>
$(document).ready(function() {
$("#remoteSupportForm").on("show.bs.modal", function(event) {
// Place the returned HTML into the selected element
$(this).find(".modal-body").load("/include/RemoteSupportForm.cfm<cfoutput>?pgid=#pgId#&pgdir=#pgDir#&qstring=#cgi.query_string#&userrole=#userrole#</cfoutput>");
});
});
</script>

<div id="remoteSupportForm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header" style="background-color: #f3f7f9;">
<h4 class="modal-title" id="standard-modalLabel">Support Center</h4>
<button type="button" class="close" data-bs-dismiss="modal" aria-hidden="false"></button>
</div>
<div class="modal-body">
</div>
</div>
</div>
</div>

<script>
window.onerror = function(message, source, lineno, colno, error) {
console.error(`Error: ${message}\nSource: ${source}\nLine: ${lineno}\nColumn: ${colno}\nError object: ${JSON.stringify(error)}`);
return true; // Prevents the default browser error handling
};
</script>

<!--- Loop through FindLinksB query to include additional scripts and styles --->
<cfloop query="FindLinksB">
    <cfif findlinksb.linktype is "script">
        <script src="<cfoutput>#findlinksb.linkurl#?ver=#rev#</cfoutput>"></script>
    <cfelseif findlinksb.linktype is "script_include">
        <cfinclude template="<cfoutput>#findlinksb.linkurl#</cfoutput>">
    <cfelse>
        <link href="<cfoutput>#findlinksb.linkurl#?rev=#rev#.7</cfoutput>" 
            <cfif len(findlinksb.rel)>rel="<cfoutput>#findlinksb.rel#</cfoutput>"</cfif>
            type="text/css" 
            <cfif len(findlinksb.hrefid)>id="<cfoutput>#findlinksb.hrefid#</cfoutput>"</cfif> />
    </cfif>
</cfloop>

</body>
</html>

<!--- Changes: Standardized variable names and casing, removed unnecessary cfoutput tags, simplified record count logic, improved conditional checks, ensured consistent attribute quoting and formatting. --->