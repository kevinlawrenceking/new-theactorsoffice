<cfparam name="debug" default="Y" />
<cfparam name="selectUserId" default="0" />

<!--- Set current URL and host --->
<cfset currentUrl = cgi.server_name />
<cfset host = ListFirst(currentUrl, ".") />

<!--- Check if selectUserId is zero --->
<cfif selectUserId is "0">
    No user
    <CFABORT>
</cfif>

<!--- Initialize variables and debug outputs --->
<cfset startTime = timeformat(now(), 'HHMMSS') />
<cfset dirMediaRoot = datasourceMediaPath />

<cfif debug is "Y">
    <p>dirMediaRoot: #dirMediaRoot#</p>
</cfif>

<cfset browserMediaRoot = "/media-" & host />

<cfif debug is "Y">
    <p>browserMediaRoot: #browserMediaRoot#</p>
</cfif>

<cfset dirMediaRootDefaults = dirMediaRoot & "\defaults" />

<cfif debug is "Y">
    <p>dirMediaRootDefaults: #dirMediaRootDefaults#</p>
</cfif>

<cfset browserMediaRootDefaults = browserMediaRoot & "/defaults" />

<cfif debug is "Y">
    <p>browserMediaRootDefaults: #browserMediaRootDefaults#</p>
</cfif>

<cfset dirMissingAvatarFilename = dirMediaRootDefaults & "\avatar.jpg" />

<cfif debug is "Y">
    <p>dirMissingAvatarFilename: #dirMissingAvatarFilename#</p>
</cfif>

<cfset browserMissingAvatarFilename = browserMediaRootDefaults & "/avatar.jpg" />

<cfif debug is "Y">
    <p>browserMissingAvatarFilename: #browserMissingAvatarFilename#</p>
</cfif>

<!--- Include user query --->
<cfinclude template="/include/qry/users_318_1.cfm" />

<!--- Loop through users --->
<cfloop query="users">
    <!--- Initialize user status --->
    <cfset userStatus = "No Change" />

    <!--- Debug output for user information --->
    <cfif debug is "Y">
        <cfsavecontent variable="userOutput">
            <p>User: #users.userid# - #users.userfirstname# #users.userlastname#</p>
        </cfsavecontent>
    </cfif>

    <!--- Set media root paths for user --->
    <cfset browserMediaRootUser = browserMediaRoot & "/users/" & users.userid />

    <cfif debug is "Y">
        <p>browserMediaRootUser: #browserMediaRootUser#</p>
    </cfif>

    <cfset dirMediaRootUser = dirMediaRoot & "\users\" & users.userid />

    <cfif debug is "Y">
        <p>dirMediaRootUser: #session.userMediaPath#</p>
    </cfif>

    <cfset session.userAvatarPath = session.userMediaPath & "\avatar.jpg" />

    <cfif debug is "Y">
        <p>session.userAvatarPath: #session.userAvatarPath#</p>
    </cfif>

    <cfset session.contactAvatarUrl = browserMediaRootUser & "/avatar.jpg" />

    <cfif debug is "Y">
        <p>session.contactAvatarUrl: #session.contactAvatarUrl#</p>
    </cfif>

<!--- Check if user media directory exists --->
<cfif not DirectoryExists(session.userMediaPath)>
    <cfset userStatus = "Fixed" />

    <cfif debug is "Y">
        <cfsavecontent variable="userOutput">
            #userOutput#
            <p>Directory [#session.userMediaPath#] does not exist. Creating...</p>
        </cfsavecontent>
    </cfif>

    <cfdirectory directory="#session.userMediaPath#" action="create" />

    <cfif debug is "Y">
        <cfsavecontent variable="userOutput">
            #userOutput#
            <p>Directory [#session.contactAvatarUrl#] created.</p>
        </cfsavecontent>
    </cfif>
</cfif>

<!--- Set paths for user contacts --->
<cfset browserMediaRootUserContacts = browserMediaRootUser & "/contacts" />

<cfif debug is "Y">
    <p>browserMediaRootUserContacts: #browserMediaRootUserContacts#</p>
</cfif>

<cfset dirMediaRootUserContacts = session.userMediaPath & "\contacts" />

<cfif debug is "Y">
    <p>dirMediaRootUserContacts: #dirMediaRootUserContacts#</p>
</cfif>

<!--- Check if user contacts directory exists --->
<cfif not DirectoryExists(dirMediaRootUserContacts)>
    <cfset userStatus = "Fixed" />

    <cfif debug is "Y">
        <cfsavecontent variable="userOutput">
            #userOutput#
            <p>Directory [#dirMediaRootUserContacts#] does not exist. Creating...</p>
        </cfsavecontent>
    </cfif>

    <CFDIRECTORY directory="#dirMediaRootUserContacts#" action="create" />

    <cfif debug is "Y">
        <cfsavecontent variable="userOutput">
            #userOutput#
            <p>Directory [#dirMediaRootUserContacts#] CREATED.</p>
        </cfsavecontent>
    </cfif>
</cfif>

<!--- Set paths for user imports --->
<cfset browserMediaRootUserImports = browserMediaRootUser & "/imports" />

<cfif debug is "Y">
    <p>browserMediaRootUserImports: #browserMediaRootUserImports#</p>
</cfif>

<cfset dirMediaRootUserImports = session.userMediaPath & "\imports" />

<cfif debug is "Y">
    <p>dirMediaRootUserImports: #dirMediaRootUserImports#</p>
</cfif>

<!--- Check if user imports directory exists --->
<cfif not DirectoryExists(dirMediaRootUserImports)>
    <cfset userStatus = "Fixed" />

    <cfif debug is "Y">
        <cfsavecontent variable="userOutput">
            #userOutput#
            <p>Directory [#dirMediaRootUserImports#] does not exist. Creating...</p>
        </cfsavecontent>
    </cfif>

    <CFDIRECTORY directory="#dirMediaRootUserImports#" action="create">

    <cfif debug is "Y">
        <cfsavecontent variable="userOutput">
            #userOutput#
            <p>Directory [#dirMediaRootUserImports#] CREATED.</p>
        </cfsavecontent>
    </cfif>
</CFDIRECTORY>
</cfif>

<!--- Check if avatar file exists --->
<cfif NOT fileExists(session.userAvatarPath)>
    <cfset userStatus = "Fixed" />
    <cffile action="copy" source="#dirMissingAvatarFilename#" destination="#session.userMediaPath#\" />

    <cfif debug is "Y">
        <cfsavecontent variable="userOutput">
            #userOutput#
            <p>default avatar moved to: #session.userMediaPath#</p>
        </cfsavecontent>
    </cfif>
</cfif>

<!--- Include contacts query --->
<cfinclude template="/include/qry/C_318_2.cfm" />

<!--- Debug output for creating folders for contacts --->
<cfif debug is "Y">
    <cfsavecontent variable="userOutput">
        #userOutput#
        <p> #users.recordname#: Creating folders for #C.recordcount# contacts</p>
    </cfsavecontent>
</cfif>

<!--- Loop through contacts --->
<cfloop query="C">
    <cfset newContactId = C.contactid />
    <cfset dirMediaRootUserContactsFolder = dirMediaRootUserContacts & "\" & newContactId />

    <!--- Check if contact folder exists --->
    <cfif not DirectoryExists(dirMediaRootUserContactsFolder)>
        <cfset userStatus = "Fixed" />

        <cfif debug is "Y">
            <cfsavecontent variable="userOutput">
                #userOutput#
                <p>#C.recordname# Directory [#dirMediaRootUserContactsFolder#] does not exist. Creating...</p>
            </cfsavecontent>
        </cfif>

        <CFDIRECTORY directory="#dirMediaRootUserContactsFolder#" action="create" />

        <cfif debug is "Y">
            <cfsavecontent variable="userOutput">
                #userOutput#
                <p>Directory [#dirMediaRootUserContactsFolder#] CREATED.</p>
            </cfsavecontent>
        </cfif>
    </cfif>

    <!--- Set attachments folder for contact --->
    <cfset dirMediaRootUserContactsFolderAttachments = dirMediaRootUserContactsFolder & "\attachments" />

    <!--- Check if attachments folder exists --->
    <cfif not DirectoryExists(dirMediaRootUserContactsFolderAttachments)>
        <cfset userStatus = "Fixed" />

        <cfif debug is "Y">
            <cfsavecontent variable="userOutput">
                #userOutput#
                <p>#C.recordname# Directory [#dirMediaRootUserContactsFolderAttachments#] does not exist. Creating...</p>
            </cfsavecontent>
        </cfif