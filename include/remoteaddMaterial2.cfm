<!--- This ColdFusion page handles user media uploads and manages the media path for the session. --->
<cfset userID = session.userID />
<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<!--- Set user media path --->
<cfset session.userMediaPath = session.userMediaPath />

<!--- Check if the user media directory exists, if not, create it --->
<cfif not DirectoryExists(session.userMediaPath)>
    <cfdirectory directory="#session.userMediaPath#" action="create">
</cfif>

<!--- Check if a file has been uploaded --->
<cfif structKeyExists(form, "file") AND len(trim(form.file)) NEQ 0>
    <cffile action="upload" filefield="form.file" destination="#session.userMediaPath#\" nameconflict="MAKEUNIQUE"/>
    <cfset newFileName = CFFILE.serverfile />

    <!--- Set new media name if it's not already set --->
    <cfif len(trim(newMediaName)) EQ 0>
        <cfset newMediaName = newFileName />
    </cfif>

    <cfset newMediaFileName = newFileName />
    <cfset newMediaExt = listLast(newMediaFileName, ".")>
<cfelse>
    <cfset newMediaExt = "" />
    <cfset newFileName = "" />
</cfif>

<!--- Include the media insertion query template --->
<cfinclude template="/include/qry/audmedia_ins.cfm"/>

<cfset newUploadID = result.generatedkey>

<!--- Redirect based on the source of the upload --->
<cfif src is "account">
    <cflocation url="/app/myaccount/?t9=1&tab9_expand=true&new_uploadid=#newUploadID#"/>
<cfelse>
    <cflocation url="/app/audition/?audprojectid=#audProjectID#&secid=177"/>
</cfif>

<!--- Changes made: 
1. Removed unnecessary cfoutput tags around variable outputs.
2. Avoided using # symbols within conditional checks.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Removed cftry and cfcatch blocks entirely.
6. For any # symbols inside cfoutput blocks that are not meant as ColdFusion variables, used double pound signs ## to avoid interpretation as variables.
--->