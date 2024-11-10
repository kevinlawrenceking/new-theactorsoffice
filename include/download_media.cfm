<!--- Set the user ID from the session --->
<cfset userID = session.userID />

<!--- Get the current server name --->
<cfset currentURL = cgi.server_name />

<!--- Extract the host from the server name --->
<cfset host = ListFirst(currentURL, ".") />

<!--- Include the attachment details template --->
<cfinclude template="/include/qry/attachdetails_109_1.cfm" />

<!--- Retrieve the media file as binary data --->
<cfhttp url="#session.userMediaUrl#/#attachdetails.mediaFileName#" getAsBinary="yes" />

<!--- Set the header for content disposition to inline with the filename --->
<cfheader name="Content-Disposition" value='inline; filename="#attachdetails.mediaFileName#"' />

<!--- Output the binary content of the media file --->
<cfcontent type="application/octet-stream" variable="#cfhttp.fileContent#" />

<!---
Changes Made:
1. Standardized variable names and casing.
2. Ensured consistent attribute quoting, spacing, and formatting.
3. Removed unnecessary `<cfoutput>` tags around variable outputs.
4. Avoided using `#` symbols within conditional checks unless essential.
--->