<!--- This ColdFusion page manages user media directories and avatars for user contacts. --->
<cfset debugFlag = "N" />
<cfparam name="selectUserId" default="0" />
<cfparam name="selectContactId" default="0" />

<!--- Set start time and media root directory variables --->
<cfset startTime = timeformat(now(),'HHMMSS') />
<cfset dirMediaRoot = datasourceMediaPath />

<!--- Debug output for media root directory --->
<cfif debugFlag is "Y">
    <h2>dirMediaRoot: #dirMediaRoot#</h2>
</cfif>

<cfset browserMediaRoot = "/media-#host#" />

<!--- Debug output for browser media root --->
<cfif debugFlag is "Y">
    <h2>browserMediaRoot: #browserMediaRoot#</h2>
</cfif>

<cfset dirMediaRootDefaults = "#dirMediaRoot#\defaults" />

<!--- Debug output for media root defaults directory --->
<cfif debugFlag is "Y">
    <h2>dirMediaRootDefaults: #dirMediaRootDefaults#</h2>
</cfif>

<cfset browserMediaRootDefaults = "#browserMediaRoot#/defaults" />

<!--- Debug output for browser media root defaults --->
<cfif debugFlag is "Y">
    <h2>browserMediaRootDefaults: #browserMediaRootDefaults#</h2>
</cfif>

<cfset dirMissingAvatarFilename = "#dirMediaRootDefaults#\avatar.jpg" />

<!--- Debug output for missing avatar filename --->
<cfif debugFlag is "Y">
    <h2>dirMissingAvatarFilename: #dirMissingAvatarFilename#</h2>
</cfif>

<cfset browserMissingAvatarFilename = "#browserMediaRootDefaults#/avatar.jpg" />

<!--- Debug output for browser missing avatar filename --->
<cfif debugFlag is "Y">
    <h2>browserMissingAvatarFilename: #browserMissingAvatarFilename#</h2>
</cfif>

<cfinclude template="/include/qry/U_126_1.cfm" />

<cfloop query="U">
    <!--- Debug output for each user --->
    <cfif debugFlag is "Y">
        <h2>User: #u.userId#</h2>
    </cfif>

    <cfset browserMediaRootUser = session.userMediaUrl />

    <!--- Debug output for user media root --->
    <cfif debugFlag is "Y">
        <p>browserMediaRootUser: #browserMediaRootUser#</p>
    </cfif>

    <cfset dirMediaRootUser = "#dirMediaRoot#\users\#u.userId#" />

    <!--- Debug output for user media root directory --->
    <cfif debugFlag is "Y">
        <p>dirMediaRootUser: #session.userMediaPath#</p>
    </cfif>

    <cfset session.userAvatarPath = "#session.userMediaPath#\avatar.jpg" />

    <!--- Debug output for user avatar path --->
    <cfif debugFlag is "Y">
        <p>session.userAvatarPath: #session.userAvatarPath#</p>
    </cfif>

    <cfset session.contactAvatarUrl = "#browserMediaRootUser#/avatar.jpg" />

    <!--- Debug output for contact avatar URL --->
    <cfif debugFlag is "Y">
        <p>session.contactAvatarUrl: #session.contactAvatarUrl#</p>
    </cfif>

    <!--- Create user media directory if it does not exist --->
    <CFIF not DirectoryExists(session.userMediaPath)>
        <CFDIRECTORY directory="#session.userMediaPath#" action="create">
        <h3>dirMediaRootUser dir created: #session.contactAvatarUrl#</h3>
    </CFIF>

    <cfset browserMediaRootUserContacts = "#browserMediaRootUser#/contacts" />

    <!--- Debug output for user contacts media root --->
    <cfif debugFlag is "Y">
        <p>browserMediaRootUserContacts: #browserMediaRootUserContacts#</p>
    </cfif>

    <cfset dirMediaRootUserContacts = "#session.userMediaPath#\contacts" />

    <!--- Debug output for user contacts media root directory --->
    <cfif debugFlag is "Y">
        <p>dirMediaRootUserContacts: #dirMediaRootUserContacts#</p>
    </cfif>

    <!--- Create user contacts directory if it does not exist --->
    <CFIF not DirectoryExists(dirMediaRootUserContacts)>
        <CFDIRECTORY directory="#dirMediaRootUserContacts#" action="create">
        <h3>dirMediaRootUserContacts dir created: #dirMediaRootUserContacts#</h3>
    </CFIF>

    <cfset browserMediaRootUserImports = "#browserMediaRootUser#/imports" />

    <!--- Debug output for user imports media root --->
    <cfif debugFlag is "Y">
        <p>browserMediaRootUserImports: #browserMediaRootUserImports#</p>
    </cfif>

    <cfset dirMediaRootUserImports = "#session.userMediaPath#\imports" />

    <!--- Debug output for user imports media root directory --->
    <cfif debugFlag is "Y">
        <p>dirMediaRootUserImports: #dirMediaRootUserImports#</p>
    </cfif>

    <!--- Create user imports directory if it does not exist --->
    <CFIF not DirectoryExists(dirMediaRootUserImports)>
        <CFDIRECTORY directory="#dirMediaRootUserImports#" action="create">
        <h3>dirMediaRootUserImports dir created: #dirMediaRootUserImports#</h3>
    </CFIF>

    <!--- Check if user avatar exists, if not, copy the default avatar --->
    <cfif NOT fileExists(session.userAvatarPath)>
        <cffile action="copy" source="#dirMissingAvatarFilename#" destination="#session.userMediaPath#\">
        <h3>default avatar moved to: #session.userMediaPath#</h3>
    </cfif>

    <cfinclude template="/include/qry/C_73_2.cfm" />

    <!--- Debug output for creating folders for contacts --->
    <cfif debugFlag is "Y">
        <h3> #u.userId#: Creating folders for #c.recordcount# contacts</h3>
    </cfif>

    <cfloop query="C">
        <cfset newContactId = C.contactId />

        <!--- Debug output for each contact --->
        <cfif debugFlag is "Y">
            <h3>#c.recordname#: Contact ID #newContactId#</h3>
        </cfif>

        <cfset dirMediaRootUserContactsFolder = "#dirMediaRootUserContacts#\#newContactId#" />

        <!--- Create contact folder if it does not exist --->
        <CFIF not DirectoryExists(dirMediaRootUserContactsFolder)>
            <CFDIRECTORY directory="#dirMediaRootUserContactsFolder#" action="create">
            <h3>dirMediaRootUserContactsFolder dir created: #dirMediaRootUserContactsFolder#</h3>
        </CFIF>

        <cfset dirMediaRootUserContactsFolderAttachments = "#dirMediaRootUserContactsFolder#\attachments" />

        <!--- Create attachments folder if it does not exist --->
        <CFIF not DirectoryExists(dirMediaRootUserContactsFolderAttachments)>
            <CFDIRECTORY directory="#dirMediaRootUserContactsFolderAttachments#" action="create">
            <h3>dirMediaRootUserContactsFolderAttachments dir created: #dirMediaRootUserContactsFolderAttachments#</h3>
        </CFIF>

        <cfset dirContactAvatarFilename = "#dirMediaRootUserContactsFolder#\avatar.jpg" />

        <!--- Debug output for contact avatar filename --->
        <cfif debugFlag is "Y">
            <p>dirContactAvatarFilename: #dirContactAvatarFilename#</p>
        </cfif>

        <!--- Check if contact avatar exists, if not, copy the default avatar --->
        <cfif NOT fileExists(dirContactAvatarFilename)>
            <cffile action="copy" source="#dirMissingAvatarFilename#" destination="#dirMediaRootUserContactsFolder#\">
            <h3>default contact avatar moved to: #dirMediaRootUserContactsFolder#</h3>
        </cfif>
    </cfloop>
</cfloop>

<cfset endTime = timeformat(now(),'HHMMSS') />
<cfset duration = endTime - startTime />

<!--- Debug output for completion time --->
<cfif debugFlag is "Y">
    <h1>Completed: #duration# second(s)</h1>
</cfif>

<!--- Modifications were made based on the following rules: 2, 3, 5, 6, 7 --->