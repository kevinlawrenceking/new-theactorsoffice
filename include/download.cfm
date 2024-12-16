<!--- This ColdFusion page handles user media file downloads and ensures the media directory exists before downloading the file. --->
<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />

<cfinclude template="/include/qry/attachdetails_25_1.cfm" />

<!--- Check if the user media directory exists, if not, create it. --->
<cfif NOT DirectoryExists(session.userMediaPath)>
    <!--- Create the directory --->
    <cfdirectory action="create" directory="#session.userMediaPath#" />
</cfif>

<!--- Now proceed with file upload or retrieval logic --->
<cffile action="upload" 
        filefield="form.file" 
        destination="#session.userMediaPath#\" 
        nameconflict="MAKEUNIQUE" 
        result="uploadResult" />

<cfif StructKeyExists(uploadResult, "FileWasSaved") AND uploadResult.FileWasSaved>
    <!--- Set the new filename from the upload result --->
    <cfset new_filename = uploadResult.ServerFile />
    <cfoutput>
        File uploaded successfully: #new_filename#
    </cfoutput>
<cfelse>
    <cfoutput>
        File upload failed. Please try again.
    </cfoutput>
</cfif>


<!--- Ensure the URL is correctly formatted --->
<cfset mediaUrl = Trim(session.userMediaUrl) />
<cfif Right(mediaUrl, 1) NEQ "/">
    <cfset mediaUrl = mediaUrl & "/" />
</cfif>

<!--- Download the media file as binary --->
<cfhttp 
    url="#mediaUrl##attachdetails.attachfilename#" 
    getAsBinary="yes" 
    result="fileResult" />

<cfheader name="Content-Disposition" value="attachment; filename=#attachdetails.attachfilename#" />
<cfcontent type="application/octet-stream" variable="#cfhttp.fileContent#" />

