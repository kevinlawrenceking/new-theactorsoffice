<!--- This ColdFusion page processes an uploaded image, saves it, and sends an email with diagnostic information. ---> 
<cfset pictureImg = imageReadBase64(form.picturebase)> 
<!--- Save the image to the specified directory ---> 
<cfimage source="#pictureImg#" destination="#cookie.uploadDirContact#" overwrite="true" action="write"> </cfimage> 

<!--- Gather diagnostic information for email ---> 
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
    <cfif isDefined('cookie.uploadDirContact')> 
        cookie.uploadDirContact: #cookie.uploadDirContact#<br /> 
    </cfif> 
    <cfif isDefined('cookie.returnUrl')> 
        cookie.returnUrl: #cookie.returnUrl#<br /> 
    </cfif> 
    <cfif isDefined('browserContactAvatarLoc')> 
        browserContactAvatarLoc: #browserContactAvatarLoc#<br /> 
    </cfif> 
    <cfif isDefined('imageUrl')> 
        imageUrl: #imageUrl#<br /> 
    </cfif> 
</cfsavecontent>

<!--- Send email with diagnostic information ---> 
<cfmail from="support@theactorsoffice.com" to="kevinking7135@gmail.com" subject="#cookie.uploadDirContact#" type="HTML"> 
    <p>#diagnostics#</p> 
</cfmail>

<!--- Changes made: 
1. Removed unnecessary <cfoutput> tags around variable outputs.
2. Standardized variable names and casing.
3. Ensured consistent attribute quoting, spacing, and formatting.
--->