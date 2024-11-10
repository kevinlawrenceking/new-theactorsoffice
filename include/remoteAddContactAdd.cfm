<!--- This ColdFusion page handles the insertion of contact information and redirects based on the source parameter. --->
<cfparam name="deleteItem" default="0" />
<cfparam name="valueText" default="" />
<cfparam name="src" default="" />
<cfparam name="birthdayDay" default="" />
<cfparam name="birthdayMonth" default="" />
<cfparam name="contactPronoun" default="" />
<cfparam name="contactMeetingDate" default="" />
<cfparam name="contactMeetingLoc" default="" />
<cfparam name="newSystemType" default="None" />
<cfparam name="companyName" default="" />

<!--- Include the query to add a new contact --->
<cfinclude template="/include/qry/add_201_1.cfm" />

<cfset currentId = result.generatedKey />
<cfset contactId = result.generatedKey />

<!--- Check if new tags are provided and insert them --->
<cfif len(trim(newTag))>
    <cfloop list="#newTag#" index="tag">
        <cfinclude template="/include/qry/insert_201_2.cfm" />
    </cfloop>
</cfif>

<!--- Check if work email is provided and insert it --->
<cfif len(trim(workEmail))>
    <cfinclude template="/include/qry/insert_201_3.cfm" />
</cfif>

<!--- Check if work phone is provided and insert it --->
<cfif len(trim(workPhone))>
    <cfinclude template="/include/qry/insert_201_4.cfm" />
</cfif>

<!--- Check if company name is provided and insert it --->
<cfif len(trim(companyName))>
    <cfinclude template="/include/qry/insert_201_5.cfm" />
</cfif>

<cfset selectContactId = contactId />
<cfset selectUserId = session.userId />

<cfinclude template="/include/contactFolderSetup.cfm" />

<!--- Redirect based on the source parameter --->
<cfif src eq "setup">
    <cflocation url="/app/setup/?setupStep=2" addToken="false" />
<cfelse>
    <cflocation url="/app/myAccount/?t2=1" addToken="false" />
</cfif>

<!--- Changes made:
1. Standardized variable names and casing.
2. Removed unnecessary # symbols within conditional checks.
3. Improved conditional logic by using len(trim()) instead of comparing with an empty string.
4. Ensured consistent attribute quoting, spacing, and formatting.
5. Added addToken="false" to cflocation tags to prevent appending of CFID and CFTOKEN parameters in the URL.
--->