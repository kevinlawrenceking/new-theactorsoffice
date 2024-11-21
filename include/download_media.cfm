<!--- This ColdFusion page handles the retrieval and display of media files for the user. --->

<cfset userid = userid /> <!--- Set the user ID from the session --->

<cfset currentURL = cgi.server_name /> <!--- Get the current server name --->

<cfset host = ListFirst(currentURL, ".") /> <!--- Extract the host from the server name --->

<cfinclude template="/include/qry/attachdetails_109_1.cfm" /> <!--- Include the attachment details template --->
<cfoutput>#userMediaUrl#/#attachdetails.mediafilename#</cfoutput><CfaborT>
<cfhttp url="#userMediaUrl#/#attachdetails.mediafilename#" getAsBinary="yes"/> <!--- Retrieve the media file as binary data --->



<cfheader name="Content-Disposition" value="inline; filename=#attachdetails.mediafilename#" />
<cfcontent type="application/octet-stream" variable="#cfhttp.fileContent#" > 