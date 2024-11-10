<!--- This ColdFusion page handles user media file downloads and ensures the media directory exists before downloading the file. --->
<cfset userID = session.userID />
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<cfinclude template="/include/qry/attachdetails_25_1.cfm" />

<!--- Check if the user media directory exists, if not, create it. --->
<cfif NOT DirectoryExists(session.userMediaPath)>
    <cfdirectory directory="#session.userMediaPath#" action="create" />
</cfif>

<!--- Download the media file as binary. --->
<cfhttp url="#session.userMediaUrl#/#attachDetails.attachFileName#" getAsBinary="yes" />

<!--- Set the header for file download. --->
<cfheader name="Content-Disposition" value="attachment; filename=#attachDetails.attachFileName#" />
<cfcontent type="application/octet-stream" variable="#cfhttp.fileContent#" />

<!--- Changes made: 
1. Removed unnecessary cfoutput tag around session.userMediaPath.
2. Removed # symbols from DirectoryExists check.
3. Standardized variable names and casing.
--->