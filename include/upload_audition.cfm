<!--- This ColdFusion page handles the upload and processing of audition data from a spreadsheet. --->
<cfparam name="new_projName" default=""/>
<cfparam name="new_projDescription" default=""/>
<cfparam name="new_audSubCatID" default=""/>
<cfparam name="new_unionID" default=""/>
<cfparam name="new_networkID" default=""/>
<cfparam name="new_toneID" default=""/>
<cfparam name="new_contractTypeID" default=""/>
<cfparam name="new_contactid" default=""/>
<cfparam name="isdirect" default="0"/>
<cfparam name="isbooked" default="0"/>
<cfparam name="ispin" default="0"/>
<cfparam name="new_audsourceid" default="0"/>

<cfset currentURL = cgi.server_name/>
<cfset host = ListFirst(currentURL, ".")/>

<cfinclude template="/include/qry/INSERT_316_1.cfm" />
<cfset new_uploadid = result.generatedkey>

<cfoutput>
    <cfset userMediaPath = "#userMediaPath#"/>
</cfoutput>

<!--- Check if the user media path directory exists, if not create it --->
<cfif not DirectoryExists("#userMediaPath#")>
    <cfdirectory directory="#userMediaPath#" action="create">
</cfif>

<!--- Upload the file to the specified directory --->
<cffile action="upload" filefield="form.file" destination="#userMediaPath#\" 
        nameconflict="MAKEUNIQUE"/>

<!--- Read the spreadsheet data into a query object --->
<cfspreadsheet action="read" query="importdata" src="#userMediaPath#\#cffile.serverfile#" 
               columnnames="projDate,projName,audRoleName,audcatsubname,audsource,cdfirstname,cdlastname,callback_yn,redirect_yn,pin_yn,booked_yn,projDescription,charDescription,note" 
               headerrow="1"/>

<!--- Function to compare two arrays for equality --->
<cffunction name="arraysAreEqual" returntype="boolean">
    <cfargument name="array1" type="array" required="true">
    <cfargument name="array2" type="array" required="true">
    <cfset var i = "">
    
    <!--- Check if arrays are of same size --->
    <cfif arrayLen(arguments.array1) neq arrayLen(arguments.array2)>
        <cfreturn false>
    </cfif>
    
    <!--- Check if arrays have same elements in same order --->
    <cfloop index="i" from="1" to="#arrayLen(arguments.array1)#">
        <cfif arguments.array1[i] neq arguments.array2[i]>
            <cfreturn false>
        </cfif>
    </cfloop>
    
    <!--- If no differences were found, the arrays are equal --->
    <cfreturn true>
</cffunction>

<!--- Get the column names from the imported data --->
<cfset spreadsheetColumns = importdata.columnList/>

<!--- Convert the string of column names to an array --->
<cfset spreadsheetColumnsArray = ListToArray(spreadsheetColumns) />

<!--- Define the correct columns for your application --->
<cfset correctColumns = "projdate,projname,audrolename,audcatsubname,audsource,cdfirstname,cdlastname,callback_yn,redirect_yn,pin_yn,booked_yn,projdescription,chardescription,note" />

<!--- Convert the correct column list to an array --->
<cfset correctColumnsArray = ListToArray(correctColumns) />

<!--- Create a variable to store the codes of products that could not be imported --->
<cfset failedimports = ""/>

<!--- Loop through the query starting with the first row containing data (row 2) --->
<cfloop query="importdata" startrow="2">
    <!--- Check if the row contains valid data (all fields must contain a value) --->
    <cfif LEN(importdata.projName) gt 0>

        <!--- Check if the hyphen exists in the string --->
        <cfif find('-', audcatsubname)>
            <cfset parts = listToArray(audcatsubname, '-')>
            <cfset audcatname = parts[1]>
            <cfset audsubcatname = parts[2]>

            <cfinclude template="/include/qry/findSubCatId_316_2.cfm" />

            <cfif #findSubCatId.recordcount# is "1">
                <cfset new_audsubcatid = "#findSubCatId.new_audsubcatid#" />
            <cfelse>
                <cfset new_audsubcatid = "0">
            </cfif>
        <cfelse>
            <!--- Handle the case where there's no hyphen --->
            <cfset audcatname = "">
            <cfset audsubcatname = "">
            <cfset new_audsubcatid = "0">
        </cfif>

        <cfinclude template="/include/qry/find_316_3.cfm" />
    </cfif>
</cfloop>

<cfinclude template="transfer_audition.cfm" />
<cfinclude template="/include/qry/fix_191_9.cfm" />

<!--- Redirect to the audition import page with the upload ID --->
<cflocation url="/app/auditions-import/?uploadid=#new_uploadid#">

