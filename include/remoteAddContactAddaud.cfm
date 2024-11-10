<!--- This ColdFusion page processes contact information and related data, including tags, emails, phones, and events. --->
<cfparam name="deleteItem" default="0" />
<cfparam name="valueText" default="" />
<cfparam name="src" default="" />
<cfparam name="birthdayDay" default="" />
<cfparam name="birthdayMonth" default="" />
<cfparam name="contactPronoun" default="" />
<cfparam name="contactMeetingDate" default="" />
<cfparam name="contactMeetingLoc" default="" />
<cfparam name="newSystemType" default="None" />
<cfparam name="company" default="" />
<cfparam name="companyNew" default="" />

<!--- Include the initial query for adding contact information --->
<cfinclude template="/include/qry/add_202_1.cfm" />

<cfset currentId = result.generatedKey />
<cfset contactId = result.generatedKey />

<!--- Check if new tags are provided and insert them --->
<cfif len(trim(newTag))>
    <cfloop list="#newTag#" index="tag">
        <cfinclude template="/include/qry/insert_202_2.cfm" />
    </cfloop>
</cfif>

<!--- Check if work email is provided and insert it --->
<cfif len(trim(workEmail))>
    <cfinclude template="/include/qry/insert_202_3.cfm" />
</cfif>

<!--- Check if work phone is provided and insert it --->
<cfif len(trim(workPhone))>
    <cfinclude template="/include/qry/insert_201_4.cfm" />
</cfif>

<!--- Check if a company is provided and is not "Custom", then insert it --->
<cfif len(trim(company)) AND company neq "Custom">
    <cfinclude template="/include/qry/insert_202_5.cfm" />
</cfif>

<!--- Check if a new company name is provided and insert it --->
<cfif len(trim(companyNew))>
    <cfinclude template="/include/qry/insert_202_6.cfm" />
</cfif>

<cfset selectContactId = contactId />
<cfset selectUserId = session.userId />

<cfinclude template="/include/contactFolderSetup.cfm" />

<!--- Include the query for adding additional contact information --->
<cfinclude template="/include/qry/add_cd_202_7.cfm" />

<cfparam name="eventsList" default="">

<!--- Check if events list is provided --->
<cfif len(trim(eventsList))>
    <cfset eventNumbers = listToArray(eventsList, ",")>
    <!--- Loop through each event number and process it --->
    <cfloop array="#eventNumbers#" index="eventNumber">
        <cfinclude template="/include/qry/findNumber_202_8.cfm" />
        <!--- Check if the event number is not found, then insert it --->
        <cfif findNumber.recordCount eq 0>
            <cfinclude template="/include/qry/inserts_202_9.cfm" />
        </cfif>
    </cfloop>
</cfif>

<!--- Redirect to the audition page with project ID and section ID --->
<cflocation url="/app/audition/?audProjectId=#audProjectId#&secId=175" />

<!--- Changes: 
1. Standardized variable names and casing.
2. Removed unnecessary # symbols within conditional checks.
3. Simplified record count logic for icons or conditional displays.
4. Ensured consistent attribute quoting, spacing, and formatting.
--->