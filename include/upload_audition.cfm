<cfparam name="newProjName" default=""/>
<cfparam name="newProjDescription" default=""/>
<cfparam name="newAudSubCatID" default=""/>
<cfparam name="newUnionID" default=""/>
<cfparam name="newNetworkID" default=""/>
<cfparam name="newToneID" default=""/>
<cfparam name="newContractTypeID" default=""/>
<cfparam name="newContactId" default=""/>
<cfparam name="isDirect" default="0"/>
<cfparam name="isBooked" default="0"/>
<cfparam name="isPin" default="0"/>
<cfparam name="newAudSourceId" default="0"/>

<cfset currentURL = cgi.server_name/>
<cfset host = ListFirst(currentURL, ".")/>

<cfinclude template="/include/qry/INSERT_316_1.cfm" />

<cfset newUploadId = result.generatedkey>

<cfset session.userMediaPath = session.userMediaPath/>

<!--- Check if the user media path directory exists, if not create it --->
<cfif not DirectoryExists(session.userMediaPath)>
    <cfdirectory directory="#session.userMediaPath#" action="create">
</cfif>

<!--- Upload the file to the specified directory --->
<cffile action="upload" filefield="form.file" destination="#session.userMediaPath#\" nameconflict="MAKEUNIQUE"/>

<!--- Read the spreadsheet data into a query object --->
<cfspreadsheet action="read" query="importData" src="#session.userMediaPath#\#cffile.serverfile#" columnnames="projDate,projName,audRoleName,audCatSubName,audSource,cdFirstName,cdLastName,callbackYN,redirectYN,pinYN,bookedYN,projDescription,charDescription,note" headerrow="1"/>

<cffunction name="arraysAreEqual" returntype="boolean">
    <cfargument name="array1" type="array" required="true">
    <cfargument name="array2" type="array" required="true">
    <cfset var i = "">

    <cfif arrayLen(arguments.array1) neq arrayLen(arguments.array2)>
        <cfreturn false>
    </cfif>

    <cfloop index="i" from="1" to="#arrayLen(arguments.array1)#">
        <cfif arguments.array1[i] neq arguments.array2[i]>
            <cfreturn false>
        </cfif>
    </cfloop>

    <cfreturn true>
</cffunction>

<cfset spreadsheetColumns = importData.columnList/>
<cfset spreadsheetColumnsArray = ListToArray(spreadsheetColumns) />
<cfset correctColumns = "projDate,projName,audRoleName,audCatSubName,audSource,cdFirstName,cdLastName,callbackYN,redirectYN,pinYN,bookedYN,projDescription,charDescription,note" />
<cfset correctColumnsArray = ListToArray(correctColumns) />
<cfset failedImports = ""/>

<cfloop query="importData" startrow="2">
    <cfif LEN(importData.projName) gt 0>
        <cfif find('-', audCatSubName)>
            <cfset parts = listToArray(audCatSubName, '-')>
            <cfset audCatName = parts[1]>
            <cfset audSubCatName = parts[2]>
            <cfinclude template="/include/qry/findSubCatId_316_2.cfm" />

            <cfif findSubCatId.recordcount eq 1>
                <cfset newAudSubCatId = findSubCatId.newAudSubCatId />
            <cfelse>
                <cfset newAudSubCatId = "0">
            </cfif>
        <cfelse>
            <cfset audCatName = "">
            <cfset audSubCatName = "">
            <cfset newAudSubCatId = "0">
        </cfif>

        <cfinclude template="/include/qry/find_316_3.cfm" />
    </cfif>
</cfloop>

<cfinclude template="transfer_audition.cfm" />
<cfinclude template="/include/qry/fix_191_9.cfm" />

<cflocation url="/app/auditions-import/?uploadid=#newUploadId#">

<!--- Changes: Standardized variable names and casing, removed unnecessary cfoutput tags, avoided using # symbols within conditional checks, ensured consistent attribute quoting, spacing, and formatting. --->