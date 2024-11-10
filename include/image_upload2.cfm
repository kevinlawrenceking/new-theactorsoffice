<!--- This ColdFusion page processes an uploaded image, saves it, and sends diagnostic information via email. --->
<cfset pictureImg = imageReadBase64(form.picturebase)>
<!--- Save the image to the specified directory --->
<cfimage source="#pictureImg#" destination="#cookie.uploadDir#" overwrite="true" action="write">
<!--- Capture diagnostic information for email --->
<cfsavecontent variable="diagnostics">
    <cfif structKeyExists(pgid)>
        pgid: #pgid#<br />
    </cfif>
    <cfif structKeyExists(ref_pgid)>
        ref_pgid: #ref_pgid#<br />
    </cfif>
    <cfif structKeyExists(userid)>
        userid: #userid#<br />
    </cfif>
    <cfif structKeyExists(cookie.uploadDir)>
        cookie.uploadDir: #cookie.uploadDir#<br />
    </cfif>
    <cfif structKeyExists(cookie.return_url)>
        cookie.return_url: #cookie.return_url#<br />
    </cfif>
    <cfif structKeyExists(browser_contact_avatar_loc)>
        browser_contact_avatar_loc: #browser_contact_avatar_loc#<br />
    </cfif>
    <cfif structKeyExists(image_url)>
        image_url: #image_url#<br />
    </cfif>
</cfsavecontent>

<!--- Send diagnostic information via email --->
<cfmail from="support@theactorsoffice.com" to="kevinking7135@gmail.com" subject="#cookie.uploadDir#" type="HTML">
    <p>#diagnostics#</p>
</cfmail>

<!--- Changes made:
1. Replaced isDefined() function with structKeyExists() for better performance and readability.
2. Removed unnecessary cfoutput tag around cfsavecontent block.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
--->