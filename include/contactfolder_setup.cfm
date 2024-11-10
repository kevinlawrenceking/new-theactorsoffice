<!--- This ColdFusion page manages user media directories and avatars for contacts. --->
<cfset debug = "N" />
<cfparam name="selectUserId" default="0" />
<cfparam name="selectContactId" default="0" />

<!--- Set current URL and host variables --->
<cfset currentUrl = cgi.server_name />
<cfset host = ListFirst(currentUrl, ".") />

<!--- Store the start time for processing --->
<cfset startTime = timeformat(now(), 'HHMMSS') />

<!--- Include the first query template --->
<cfinclude template="/include/qry/U_73_1.cfm" />

<!--- Loop through user query results --->
<cfloop query="U">
    <!--- Debug output for user ID --->
    <cfif debug is "Y">
        <h2>User: #u.userId#</h2>
    </cfif>

    <!--- Set user media root URL --->
    <cfset browserMediaRootUser = session.userMediaUrl />
    <cfset session.contactAvatarUrl = browserMediaRootUser & "/avatar.jpg" />

    <!--- Debug output for contact avatar URL --->
    <cfif debug is "Y">
        <p>session.contactAvatarUrl: #session.contactAvatarUrl#</p>
    </cfif>

    <!--- Create user media directory if it doesn't exist --->
    <cfif not DirectoryExists(session.userMediaPath)>
        <CFDIRECTORY directory="#session.userMediaPath#" action="create">
        <h3>dirMediaRootUser dir created: #session.contactAvatarUrl#</h3>
    </cfif>

    <!--- Set contacts media root URL --->
    <cfset browserMediaRootUserContacts = browserMediaRootUser & "/contacts" />

    <!--- Debug output for contacts media root URL --->
    <cfif debug is "Y">
        <p>browserMediaRootUserContacts: #browserMediaRootUserContacts#</p>
    </cfif>

    <cfset dirMediaRootUserContacts = session.userMediaPath & "\contacts" />

    <!--- Debug output for contacts media directory --->
    <cfif debug is "Y">
        <p>dirMediaRootUserContacts: #dirMediaRootUserContacts#</p>
    </cfif>

    <!--- Create contacts media directory if it doesn't exist --->
    <cfif not DirectoryExists(dirMediaRootUserContacts)>
        <CFDIRECTORY directory="#dirMediaRootUserContacts#" action="create">
        <h3>dirMediaRootUserContacts dir created: #dirMediaRootUserContacts#</h3>
    </cfif>

    <!--- Set imports media root URL --->
    <cfset browserMediaRootUserImports = browserMediaRootUser & "/imports" />

    <!--- Debug output for imports media root URL --->
    <cfif debug is "Y">
        <p>browserMediaRootUserImports: #browserMediaRootUserImports#</p>
    </cfif>

    <cfset dirMediaRootUserImports = session.userMediaPath & "\imports" />

    <!--- Debug output for imports media directory --->
    <cfif debug is "Y">
        <p>dirMediaRootUserImports: #dirMediaRootUserImports#</p>
    </cfif>

    <!--- Create imports media directory if it doesn't exist --->
    <cfif not DirectoryExists(dirMediaRootUserImports)>
        <CFDIRECTORY directory="#dirMediaRootUserImports#" action="create">
        <h3>dirMediaRootUserImports dir created: #dirMediaRootUserImports#</h3>
    </cfif>

    <!--- Check if user avatar exists, if not, copy default avatar --->
    <cfif NOT fileExists(session.userAvatarPath)>
        <cffile action="copy" source="#application.defaultAvatarUrl#" destination="#session.userMediaPath#\" />
        <h3>default avatar moved to: #session.userMediaPath#</h3>
    </cfif>

    <!--- Include the second query template --->
    <cfinclude template="/include/qry/C_73_2.cfm" />

    <!--- Debug output for creating folders for contacts --->
    <cfif debug is "Y">
        <h3>#u.userId#: Creating folders for #c.recordcount# contacts</h3>
    </cfif>

    <!--- Loop through contact query results --->
    <cfloop query="C">
        <cfset newContactId = C.contactId />

        <!--- Debug output for contact ID --->
        <cfif debug is "Y">
            <h3>#c.recordname#: Contact ID #newContactId#</h3>
        </cfif>

        <cfset dirMediaRootUserContactsFolder = dirMediaRootUserContacts & "\" & newContactId />

        <!--- Create contact media directory if it doesn't exist --->
        <cfif not DirectoryExists(dirMediaRootUserContactsFolder)>
            <CFDIRECTORY directory="#dirMediaRootUserContactsFolder#" action="create">
            <h3>dirMediaRootUserContactsFolder dir created: #dirMediaRootUserContactsFolder#</h3>
        </cfif>

        <!--- Set attachments directory for contact --->
        <cfset dirMediaRootUserContactsFolderAttachments = dirMediaRootUserContactsFolder & "\attachments" />

        <!--- Create attachments directory if it doesn't exist --->
        <cfif not DirectoryExists(dirMediaRootUserContactsFolderAttachments)>
            <CFDIRECTORY directory="#dirMediaRootUserContactsFolderAttachments#" action="create">
            <h3>dirMediaRootUserContactsFolderAttachments dir created: #dirMediaRootUserContactsFolderAttachments#</h3>
        </cfif>

        <!--- Set contact avatar filename --->
        <cfset dirContactAvatarFilename = dirMediaRootUserContactsFolder & "\avatar.jpg" />

        <!--- Debug output for contact avatar filename --->
        <cfif debug is "Y">
            <p>dirContactAvatarFilename: #dirContactAvatarFilename#</p>
        </cfif>

        <!--- Check if contact avatar exists, if not, copy default avatar --->
        <cfif NOT fileExists(dirContactAvatarFilename)>
            <cffile action="copy" source="#application.defaultAvatarUrl#" destination="#dirMediaRootUserContactsFolder#\" />
            <h3>default contact avatar moved to: #dirMediaRootUserContactsFolder#</h3>
        </cfif>
    </cfloop>
</cfloop>

<!--- Store the end time for processing and calculate duration --->
<cfset endTime = timeformat(now(), 'HHMMSS') />
<cfset duration = endTime - startTime />

<!--- Debug output for processing completion --->
<cfif debug is "Y">
    <h1>Completed: #duration# second(s)</h1>
</cfif>

<!--- Modifications were made based on standards 2, 3, 5, 6, 7. --->