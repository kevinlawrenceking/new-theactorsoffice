<!--- This ColdFusion page processes a link URL and generates a return URL based on the presence of an 'audprojectid' --->
<cfif left(linkurl,4) neq "http">
    <!--- If the link URL does not start with 'http', prepend 'https://' --->
    <cfset linkurl = "https://" & linkurl />
</cfif>

<!--- Include the template for adding a record --->
<cfinclude template="/include/qry/add_149_1.cfm" />

<cfset linkId = result.generatedKey />

<!--- Check if 'audprojectid' is defined --->
<cfif isDefined('audProjectId')>
    <!--- Set the return URL with 'audprojectid' --->
    <cfset returnUrl = "/app/" & returnUrl & "/?contactid=" & rContactId & "&audprojectid=" & audProjectId & "&tab2_expand=true&secid=178&t3=1" />
<cfelse>
    <!--- Set the return URL with 'eventid' if 'audprojectid' is not defined --->
    <cfset returnUrl = "/app/" & returnUrl & "/?contactid=" & rContactId & "&eventid=" & rEventId & "&tab2_expand=true&secid=178&t3=1" />
</cfif>

<!--- Redirect to the generated return URL --->
<cflocation url="#returnUrl#" addtoken="no" />

<!---
Modifications:
1. Removed unnecessary # symbols from conditional checks.
2. Removed unnecessary cfoutput tags around variable outputs.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
--->