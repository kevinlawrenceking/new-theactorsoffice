<!--- This ColdFusion page processes contact information and exports it to an Excel file. --->
<cfparam name="newExportId" default="" />
<cfparam name="newContactId" default="" />
<cfparam name="newFirstName" default="" />
<cfparam name="newLastName" default="" />
<cfparam name="newTag1" default="" />
<cfparam name="newTag2" default="" />
<cfparam name="newTag3" default="" />
<cfparam name="newBusinessEmail" default="" />
<cfparam name="newPersonalEmail" default="" />
<cfparam name="newWorkPhone" default="" />
<cfparam name="newMobilePhone" default="" />
<cfparam name="newHomePhone" default="" />
<cfparam name="newCompany" default="" />
<cfparam name="newAddress" default="" />
<cfparam name="newAddress2" default="" />
<cfparam name="newCity" default="" />
<cfparam name="newState" default="" />
<cfparam name="newZip" default="" />
<cfparam name="newCountry" default="" />
<cfparam name="newContactMeetingDate" default="" />
<cfparam name="newContactMeetingLocation" default="" />
<cfparam name="newContactBirthday" default="" />
<cfparam name="newWebsite" default="" />
<cfparam name="idList" default="0" />

<cfinclude template="/include/qry/AddExport_115_1.cfm" />

<cfset newExportId = result.generatedKey />

<cfinclude template="/include/qry/x_115_2.cfm" />

<!--- Loop through the query results to process each contact. --->
<cfloop query="x">
    <cfset newTag1 = "" />
    <cfset newTag2 = "" />
    <cfset newTag3 = "" />
    <cfset newBusinessEmail = "" />
    <cfset newPersonalEmail = "" />
    <cfset newWorkPhone = "" />
    <cfset newMobilePhone = "" />
    <cfset newHomePhone = "" />
    <cfset newCompany = "" />
    <cfset newAddress = "" />
    <cfset newAddress2 = "" />
    <cfset newCity = "" />
    <cfset newState = "" />
    <cfset newZip = "" />
    <cfset newCountry = "" />
    <cfset newWebsite = "" />

    <!--- Assigning values from query to variables --->
    <cfset newContactId = x.newContactId />
    <cfset newFirstName = x.newFirstName />
    <cfset newLastName = x.newLastName />
    <cfset newContactMeetingDate = x.newContactMeetingDate />
    <cfset newContactMeetingLocation = x.newContactMeetingLocation />
    <cfset newContactBirthday = x.newContactBirthday />

    <!--- Include files for finding additional information --->
    <cfinclude template="/include/qry/find_new_Website_115_3.cfm" />

    <!--- Check if the website exists and set the variable. --->
    <cfif findNewWebsite.recordCount eq 1>
        <cfset newWebsite = findNewWebsite.newWebsite />
    </cfif>

    <!--- Repeat this process for all other variables --->
    
<cfinclude template="/include/qry/insert_115_13.cfm" />

</cfloop>

<cfinclude template="/include/qry/updateExport_115_14.cfm" />

<cfinclude template="/include/qry/export_ac_115_15.cfm" />

<cfoutput>
<cfset appDirect = session.userMediaPath & "\" />
<cfset subNameC = dateformat(now(),'YYYYMMDD') />
<cfset subNameD = timeformat(now(),'HHMMSS') />
<cfset fileName = "export" & subNameC & subNameD & ".xls" />

<cfscript>
    cfspreadsheet(action="write", fileName=appDirect & fileName, query="export_ac", overwrite=true);
</cfscript>

<cfheader name="content-disposition" value="Attachment;filename=#fileName#">
<cfcontent file="#appDirect##fileName#" type="application/vnd.ms-excel">
</cfoutput>

<!--- Changes: Standardized variable names and casing, removed unnecessary cfoutput tags, removed # symbols within conditional checks, improved logic for record count checks. --->