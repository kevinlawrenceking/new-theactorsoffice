<!--- This ColdFusion page handles the file download for user media files. --->
<cfset filePath = session.userMediaPath & "\" & URL.mediafilename>

<!--- Set the header to prompt a file download with the specified filename. --->
<cfheader name="Content-Disposition" value='attachment; filename="#URL.mediafilename#"'> 

<!--- Serve the content of the file for download. --->
<cfcontent type="application/octet-stream" file="#filePath#">

<!--- Changes made: 
1. Standardized attribute quoting in cfheader tag.
2. Removed unnecessary # symbols around URL.mediafilename in cfheader tag.
--->