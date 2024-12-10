<!--- This ColdFusion page handles file uploads and manages user media paths. --->

<cfset userid = userid />

<cfset currentURL = cgi.server_name />

<cfset host = ListFirst(currentURL, ".") />

<!--- Check if the user media path directory exists, if not, create it --->
<CFIF not DirectoryExists("#session.userMediaPath#")>
    <CFDIRECTORY directory="#session.userMediaPath#" action="create">
</CFIF>

<!--- Upload the file to the user's media path --->
<cffile action="upload" 
        filefield="form.file" 
        destination="#session.userMediaPath#\" 
        nameconflict="MAKEUNIQUE" />

<cfset new_filename = CFFILE.serverfile />

<cfoutput>
    <!--- Set the attachment name if it is not already set --->
    <cfif #attachname# is "">
        <cfset attachname = "#new_filename#" />
    </cfif>
    
    <cfset attachfilename = "#new_filename#" />
</cfoutput>

<!--- Include the query for inserting the upload record --->
<cfinclude template="/include/qry/INSERT_22_1.cfm" />

<cfoutput>
    <!--- Construct the return URL with parameters --->
    <cfset returnurl = "/app/#returnurl#/?contactid=#rcontactid#&eventid=#reventid#&tab2_expand=true&t3=1" />
</cfoutput>

<!--- Redirect to the return URL --->
<cflocation url="#returnurl#" />
