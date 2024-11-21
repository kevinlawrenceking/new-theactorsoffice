<cfset userid = userid />
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />
<cfinclude template="/include/qry/attachdetails_109_1.cfm" />
<cfoutput>#userMediaUrl#/#attachdetails.mediafilename#</cfoutput>
<cfhttp url="#userMediaUrl#/#attachdetails.mediafilename#" getAsBinary="yes"/>
<cfheader name="Content-Disposition" value="inline; filename=#attachdetails.mediafilename#" />
<cfcontent type="application/octet-stream" variable="#cfhttp.fileContent#" > 