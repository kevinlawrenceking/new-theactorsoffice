<!--- This ColdFusion page processes an uploaded image, saves it, and sends an email with diagnostic information. --->

<cfset pictureImg = imageReadBase64(form.picturebase)>

<cfoutput>

   <cfset cookie.uploadDir = "#dir_contact_avatar_filename#" />
        <cfset cookie.return_url = "/app/contact/?contactid=#contactid#" />
        <cfset subtitle = "#FindRefContacts.recordname#" />
        <cfset browser_contact_avatar_loc = "/media-#host#/users/#userid#/contacts/#contactid#" />
        <cfset browser_contact_avatar_filename = "#browser_contact_avatar_loc#/avatar.jpg" />
        <cfset image_url = "#browser_contact_avatar_filename#" />


</cfoutput>
<!--- Save the image to the specified directory --->
<cfimage 
    source="#pictureImg#"
    destination="#cookie.uploadDir_Contact#" 
    overwrite="true"
    action="write">
</cfimage>

<!--- Gather diagnostic information for email --->
<cfoutput>
    <cfsavecontent variable="diagnostics">
        <cfif isDefined('pgid')>
            pgid: #pgid#<br />
        </cfif>
        <cfif isDefined('ref_pgid')>
            ref_pgid: #ref_pgid#<br />
        </cfif>
        <cfif isDefined('userid')>
            userid: #userid#<br />
        </cfif>
        <cfif isDefined('cookie.uploadDir_Contact')>
            cookie.uploadDir_Contact: #cookie.uploadDir_Contact#<br />
        </cfif>
        <cfif isDefined('cookie.return_url')>
            cookie.return_url: #cookie.return_url#<br />
        </cfif>
        <cfif isDefined('browser_contact_avatar_loc')>
            browser_contact_avatar_loc: #browser_contact_avatar_loc#<br />
        </cfif>
        <cfif isDefined('image_url')>
            image_url: #image_url#<br />
        </cfif>
    </cfsavecontent>
</cfoutput>

<!--- Send email with diagnostic information --->
<cfmail 
    from="support@theactorsoffice.com" 
    to="kevinking7135@gmail.com" 
    subject="#cookie.uploadDir_Contact#" 
    type="HTML">
    <p>#diagnostics#</p>
</cfmail>
