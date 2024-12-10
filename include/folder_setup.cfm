<cfset dbug = "N" />

<cfparam name="select_userid" default="0" />
<cfparam name="select_contactid" default="0" />

<cfset starttime = timeformat(now(), 'HHMMSS') />

    <cfset browser_media_root_user = session.userMediaUrl />
    <cfset dir_media_root_user = session.userMediaPath />
    <cfset browser_media_root_user_contacts = session.userContactsUrl />
    <cfset dir_media_root_user_contacts = session.userContactsPath />
    <cfset browser_media_root_user_imports = session.userImportsUrl />
    <cfset dir_media_root_user_imports = "#session.userMediaPath#\imports" />

<cfif not directoryExists(dir_media_root_user)>
        <cfdirectory directory="#dir_media_root_user#" action="create">
    </cfif>

    <cfif not directoryExists(dir_media_root_user_contacts)>
        <cfdirectory directory="#dir_media_root_user_contacts#" action="create">
    </cfif>

    <cfif not directoryExists(dir_media_root_user_imports)>
        <cfdirectory directory="#dir_media_root_user_imports#" action="create">
    </cfif>

    <cfif not fileExists(session.userAvatarPath)>
        <cffile action="copy" source="#dir_missing_avatar_filename#" destination="#session.userMediaPath#\" />
    </cfif>

    <cfinclude template="/include/qry/C_73_2.cfm" />

  <cfloop query="C">
    <cfset new_contactid = C.contactid />
    <cfset dir_media_root_user_contacts_folder = dir_media_root_user_contacts & "\" & new_contactid />
    <cfset dir_media_root_user_contacts_folder_attachments = dir_media_root_user_contacts_folder & "\attachments" />

    <cfif not directoryExists(dir_media_root_user_contacts_folder)>
        <cfdirectory directory="#dir_media_root_user_contacts_folder#" action="create">
    </cfif>

    <cfif not directoryExists(dir_media_root_user_contacts_folder_attachments)>
        <cfdirectory directory="#dir_media_root_user_contacts_folder_attachments#" action="create">
    </cfif>

    <cfif not fileExists(session.userAvatarPath)>
        <cffile action="copy" source="#dir_missing_avatar_filename#" destination="#dir_media_root_user_contacts_folder#\" />
    </cfif>
</cfloop>

<cfoutput>
    <cfset endtime = timeformat(now(), 'HHMMSS') />
    <cfset dur = endtime - starttime />
</cfoutput>
