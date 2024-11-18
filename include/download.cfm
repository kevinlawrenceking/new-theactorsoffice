<!--- This ColdFusion page handles user media file downloads and ensures the media directory exists before downloading the file. --->
<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />

<cfinclude template="/include/fetchUsers.cfm" />

<cfinclude template="/include/qry/attachdetails_25_1.cfm" />

<cfoutput>
    session.userMediaPath
</cfoutput>

<!--- Check if the user media directory exists, if not, create it. --->
<CFIF not DirectoryExists("#session.userMediaPath#")>
    <CFDIRECTORY directory="#session.userMediaPath#" action="create" />
</CFIF>

<!--- Download the media file as binary. --->
<cfhttp url="#userMediaUrl#/#attachdetails.attachfilename#" getAsBinary="yes" />

<!--- Set the header for file download. --->
<cfheader name="Content-Disposition" value="attachment; filename=#attachdetails.attachfilename#" />
<cfcontent type="application/octet-stream" variable="#cfhttp.fileContent#" />

