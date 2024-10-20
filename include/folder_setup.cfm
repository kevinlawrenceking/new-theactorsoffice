<!--- This ColdFusion page manages user media directories and avatars for user contacts. --->
<cfset dbug="N" />

<cfparam name="select_userid" default="0" />
<cfparam name="select_contactid" default="0" />

<cfoutput>
    <!--- Set start time and media root directory variables --->
    <cfset starttime = "#timeformat(NOw(),'HHMMSS')#" />
    <cfset dir_media_root = "#datasourceMediaPath#" />

    <!--- Debug output for media root directory --->
    <cfif #dbug# is "Y">
        <h2>dir_media_root: #dir_media_root#</h2>
    </cfif>

    <cfset browser_media_root = "/media-#host#" />

    <!--- Debug output for browser media root --->
    <cfif #dbug# is "Y">
        <h2>browser_media_root: #browser_media_root#</h2>
    </cfif>

    <cfset dir_media_root_defaults = "#dir_media_root#\defaults" />

    <!--- Debug output for media root defaults directory --->
    <cfif #dbug# is "Y">
        <h2>dir_media_root_defaults: #dir_media_root_defaults#</h2>
    </cfif>

    <cfset browser_media_root_defaults = "#browser_media_root#/defaults" />

    <!--- Debug output for browser media root defaults --->
    <cfif #dbug# is "Y">
        <h2>browser_media_root_defaults: #browser_media_root_defaults#</h2>
    </cfif>

    <cfset dir_missing_avatar_filename = "#dir_media_root_defaults#\avatar.jpg" />

    <!--- Debug output for missing avatar filename --->
    <cfif #dbug# is "Y">
        <h2>dir_missing_avatar_filename: #dir_missing_avatar_filename#</h2>
    </cfif>

    <cfset browser_missing_avatar_filename = "#browser_media_root_defaults#/avatar.jpg" />

    <!--- Debug output for browser missing avatar filename --->
    <cfif #dbug# is "Y">
        <h2>browser_missing_avatar_filename: #browser_missing_avatar_filename#</h2>
    </cfif>
</cfoutput>

<cfinclude template="/include/qry/U_126_1.cfm" />

<cfloop query="U">
    <cfoutput>
        <!--- Debug output for each user --->
        <cfif #dbug# is "Y">
            <h2>User: #u.userid#</h2>
        </cfif>

        <cfset browser_media_root_user = "#session.userMediaUrl#" />

        <!--- Debug output for user media root --->
        <cfif #dbug# is "Y">
            <p>browser_media_root_user: #browser_media_root_user#</p>
        </cfif>

        <cfset dir_media_root_user = "#dir_media_root#\users\#u.userid#" />

        <!--- Debug output for user media root directory --->
        <cfif #dbug# is "Y">
            <p>dir_media_root_user: #session.userMediaPath#</p>
        </cfif>

        <cfset session.userAvatarPath = "#session.userMediaPath#\avatar.jpg" />

        <!--- Debug output for user avatar path --->
        <cfif #dbug# is "Y">
            <p>session.userAvatarPath: #session.userAvatarPath#</p>
        </cfif>

        <cfset session.contactAvatarUrl = "#browser_media_root_user#/avatar.jpg" />

        <!--- Debug output for contact avatar URL --->
        <cfif #dbug# is "Y">
            <p>session.contactAvatarUrl: #session.contactAvatarUrl#</p>
        </cfif>

        <!--- Create user media directory if it does not exist --->
        <CFIF not DirectoryExists("#session.userMediaPath#")>
            <CFDIRECTORY directory="#session.userMediaPath#" action="create">
            <h3>dir_media_root_user dir created: #session.contactAvatarUrl#</h3>
        </CFIF>

        <cfset browser_media_root_user_contacts = "#browser_media_root_user#/contacts" />

        <!--- Debug output for user contacts media root --->
        <cfif #dbug# is "Y">
            <p>browser_media_root_user_contacts: #browser_media_root_user_contacts#</p>
        </cfif>

        <cfset dir_media_root_user_contacts = "#session.userMediaPath#\contacts" />

        <!--- Debug output for user contacts media root directory --->
        <cfif #dbug# is "Y">
            <p>dir_media_root_user_contacts: #dir_media_root_user_contacts#</p>
        </cfif>

        <!--- Create user contacts directory if it does not exist --->
        <CFIF not DirectoryExists("#dir_media_root_user_contacts#")>
            <CFDIRECTORY directory="#dir_media_root_user_contacts#" action="create">
            <h3>dir_media_root_user_contacts dir created: #dir_media_root_user_contacts#</h3>
        </CFIF>

        <cfset browser_media_root_user_imports = "#browser_media_root_user#/imports" />

        <!--- Debug output for user imports media root --->
        <cfif #dbug# is "Y">
            <p>browser_media_root_user_imports: #browser_media_root_user_imports#</p>
        </cfif>

        <cfset dir_media_root_user_imports = "#session.userMediaPath#\imports" />

        <!--- Debug output for user imports media root directory --->
        <cfif #dbug# is "Y">
            <p>dir_media_root_user_imports: #dir_media_root_user_imports#</p>
        </cfif>

        <!--- Create user imports directory if it does not exist --->
        <CFIF not DirectoryExists("#dir_media_root_user_imports#")>
            <CFDIRECTORY directory="#dir_media_root_user_imports#" action="create">
            <h3>dir_media_root_user_imports dir created: #dir_media_root_user_imports#</h3>
        </CFIF>

        <!--- Check if user avatar exists, if not, copy the default avatar --->
        <cfif NOT fileExists(session.userAvatarPath)>
            <cffile action="copy" source="#dir_missing_avatar_filename#" destination="#session.userMediaPath#\" />
            <h3>default avatar moved to: #session.userMediaPath#</h3>
        </cfif>
    </cfoutput>

    <cfinclude template="/include/qry/C_73_2.cfm" />

    <!--- Debug output for creating folders for contacts --->
    <cfif #dbug# is "Y">
        <cfoutput>
            <h3> #u.userid#: Creating folders for #c.recordcount# contacts</h3>
        </cfoutput>
    </cfif>

    <cfloop query="C">
        <cfoutput>
            <cfset new_contactid = "#C.contactid#" />

            <!--- Debug output for each contact --->
            <cfif #dbug# is "Y">
                <h3>#c.recordname#: Contact ID #new_contactid#</h3>
            </cfif>

            <cfset dir_media_root_user_contacts_folder = "#dir_media_root_user_contacts#\#new_contactid#" />

            <!--- Create contact folder if it does not exist --->
            <CFIF not DirectoryExists("#dir_media_root_user_contacts_folder#")>
                <CFDIRECTORY directory="#dir_media_root_user_contacts_folder#" action="create">
                <h3>dir_media_root_user_contacts_folder dir created: #dir_media_root_user_contacts_folder#</h3>
            </CFIF>

            <cfset dir_media_root_user_contacts_folder_attachements = "#dir_media_root_user_contacts_folder#\attachments" />

            <!--- Create attachments folder if it does not exist --->
            <CFIF not DirectoryExists("#dir_media_root_user_contacts_folder_attachements#")>
                <CFDIRECTORY directory="#dir_media_root_user_contacts_folder_attachements#" action="create">
                <h3>dir_media_root_user_contacts_folder_attachements dir created: #dir_media_root_user_contacts_folder_attachements#</h3>
            </CFIF>

            <cfset dir_contact_avatar_filename = "#dir_media_root_user_contacts_folder#\avatar.jpg" />

            <!--- Debug output for contact avatar filename --->
            <cfif #dbug# is "Y">
                <p>dir_contact_avatar_filename: #dir_contact_avatar_filename#</p>
            </cfif>

            <!--- Check if contact avatar exists, if not, copy the default avatar --->
            <cfif NOT fileExists(dir_contact_avatar_filename)>
                <cffile action="copy" source="#dir_missing_avatar_filename#" destination="#dir_media_root_user_contacts_folder#\" />
                <h3>default contact avatar moved to: #dir_media_root_user_contacts_folder#</h3>
            </cfif>
        </cfoutput>
    </cfloop>
</cfloop>

<cfoutput>
    <cfset endtime = "#timeformat(NOw(),'HHMMSS')#" />
    <cfset dur = endtime - starttime />
    
    <!--- Debug output for completion time --->
    <cfif #dbug# is "Y">  
        <h1>Completed: <cfoutput>#dur# second(s)</cfoutput></h1>
    </cfif>
</cfoutput>

