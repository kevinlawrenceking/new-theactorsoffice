<!--- This ColdFusion page handles the import of contact data from a spreadsheet, processes the data, and updates the database accordingly. --->

<cfset userid = session.userid />

<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<cfinclude template="/include/qry/INSERT_315_1.cfm" />

<cfset new_uploadid = result.generatedkey />

<cfoutput>
    <cfset session.userMediaPath = "C:\home\theactorsoffice.com\wwwroot\#host#-subdomain\media-#host#\users\#userid#" />
</cfoutput>

<!--- Check if the user media path exists, if not, create it --->
<CFIF not DirectoryExists("#session.userMediaPath#")>
    <CFDIRECTORY directory="#session.userMediaPath#" action="create">
</CFIF>

<cffile action="upload" filefield="form.file" destination="#session.userMediaPath#\" nameconflict="MAKEUNIQUE" />

<!--- Read the spreadsheet data into a query object --->
<cfspreadsheet action="read" 
    sheetname="TAO Import Template" 
    src="#session.userMediaPath#\#cffile.serverfile#" 
    query="importdata" 
    columnnames="FirstName,LastName,Tag1,Tag2,Tag3,BusinessEmail,PersonalEmail,WorkPhone,MobilePhone,HomePhone,Company,Address,Address2,City,State,Zip,Country,contactMeetingDate,contactMeetingLocation,Birthday,website,Notes" 
    headerrow="1" />

<!--- Create a variable to store the codes of products that could not be imported --->
<cfset failedimports = "" />

<!--- Loop through the query starting with the first row containing data (row 2) --->
<cfloop query="importdata" startrow="2">
    <!--- Check if the row contains valid data (all fields must contain a value and price must be numeric) --->
    <Cfif LEN(importdata.FirstName) gt 0>
        <cfinclude template="/include/qry/find_315_2.cfm" />
    </Cfif>
</cfloop>

<cfinclude template="/include/qry/x_315_3.cfm" />
<cfoutput>x: #x.recordcount#<BR></cfoutput>

<cfloop query="x">
    <cfinclude template="/include/qry/find_315_4.cfm" />
    <cfoutput>find: #find.recordcount#<BR></cfoutput>

    <cfif #find.recordcount# is "1">
        <cfset new_status = "Duplicate" />
        <cfset new_contactid = find.contactid />
        <cfoutput>result:duplicate - #find.contactid#<BR></cfoutput>
        <cfinclude template="/include/qry/update_315_5.cfm" />
    <cfelse>
        <cfinclude template="/include/qry/add_315_6.cfm" />
        <cfset new_status = "Added" />
        <cfset new_contactid = result.generatedkey />
        <cfset contactid = result.generatedkey />
        <cfinclude template="/include/birthday_fix.cfm" />
        <cfoutput>result: added - #new_contactid#<BR></cfoutput>

        <cfset select_userid = session.userid />
        <cfset select_contactid = new_contactid />
        <cfinclude template="/include/folder_setup.cfm" />
    </cfif>

    <cfif #x.notes# is not ""> 
        <cfset select_userid = session.userid />
        <cfset select_contactid = new_contactid />
        <cfinclude template="/include/qry/find_note_315_7.cfm" />
        
        <cfif #find_Note.recordcount# is "0">
            <cfinclude template="/include/qry/InsertNote_315_8.cfm" />
        </cfif> 
    </cfif>

    <cfinclude template="/include/qry/update_315_5.cfm" />
</cfloop>

<cfinclude template="/include/qry/tag_315_10.cfm" />
<cfloop query="tag">
    <cfset new_tag1 = tag.tag1 />
    <cfinclude template="/include/qry/tag_insert_315_11.cfm" />
</cfloop>

<cfinclude template="/include/qry/tag_315_12.cfm" />
<cfloop query="tag">
    <cfset new_tag2 = tag.tag2 />
    <cfinclude template="/include/qry/tag_insert_315_13.cfm" />
</cfloop>

<cfinclude template="/include/qry/tag_315_14.cfm" />
<cfloop query="tag">
    <cfset new_tag3 = tag.tag3 />
    <cfinclude template="/include/qry/tag_insert_315_15.cfm" />
</cfloop>

<cfinclude template="/include/qry/e_315_16.cfm" />
<cfloop query="e">
    <cfinclude template="/include/qry/e_insert_315_17.cfm" />
</cfloop>

<cfinclude template="/include/qry/f_315_18.cfm" />
<cfloop query="f">
    <cfinclude template="/include/qry/f_insert_315_19.cfm" />
</cfloop>

<cfinclude template="/include/qry/g_315_20.cfm" />
<cfloop query="g">
    <cfinclude template="/include/qry/g_insert_315_21.cfm" />
</cfloop>

<cfinclude template="/include/qry/h_315_22.cfm" />
<cfloop query="h">
    <cfinclude template="/include/qry/h_insert_315_23.cfm" />
</cfloop>

<cfinclude template="/include/qry/i_315_24.cfm" />
<cfloop query="i">
    <cfinclude template="/include/qry/i_insert_315_25.cfm" />
</cfloop>

<cfinclude template="/include/qry/j_315_26.cfm" />
<cfloop query="j">
    <cfinclude template="/include/qry/j_insert_315_27.cfm" />
</cfloop>

<cfinclude template="/include/qry/u_315_28.cfm" />
<cfloop query="u">
    <cfinclude template="/include/qry/u_insert_315_29.cfm" />
</cfloop>

<cfinclude template="/include/qry/address_315_30.cfm" />
<cfloop query="address">
    <cfif #TRIM(address.address)# is "" and #trim(address.address_second)# is "" and #TRIM(address.city)# is "" and #trim(address.state)# is "" and #TRIM(address.zip)# is "" and #TRIM(address.country)# is "">
    <cfelse>
        <cfinclude template="/include/qry/address_insert_315_31.cfm" />
    </cfif>
</cfloop>

<cfinclude template="/include/qry/maints_315_32.cfm" />
<Cfloop query="maints">
    <cfoutput>
        <cfset maint_contactid = #maints.contactid# />
    </cfoutput>

    <cfif #maints.tag# is "Casting Director" or #maints.tag# is "Casting Assistant" or #maints.tag# is "Casting Associate">
        <cfset maint_systemid = 3 />
    <cfelse>
        <cfset maint_systemid = 4 />
    </cfif>

    <cfinclude template="/include/qry/findsystem_315_33.cfm" />
    <cfif #findsystem.recordcount# is "0">
        <cfoutput>
            <Cfset suStartDate = "#DateFormat(Now(),'yyyy-mm-dd')#" />
            <Cfset currentStartDate = "#DateFormat(Now(),'yyyy-mm-dd')#" />
        </cfoutput>

        <cfinclude template="/include/qry/addSystem_315_34.cfm" />
        <cfset NewSUID = result.generatedkey />

        <cfinclude template="/include/qry/addDaysNo_315_35.cfm" />
        <cfloop query="addDaysNo">
            <cfinclude template="/include/qry/checkUnique_315_36.cfm" />
            <cfif #checkunique.recordcount# is "0">
                <!--- for every action, calculate the start date based on the actionDaysNo field and the current date --->
                <cfset notstartdate = dateAdd('d', actionDaysNo, currentstartdate) />
                <cfif notstartdate lte currentstartdate>
                    <cfinclude template="/include/qry/addNotification_315_37.cfm" />
                <cfelse>
                    <cfinclude template="/include/qry/addNotification_315_38.cfm" />
                </cfif>
            </cfif>
        </cfloop>
    </cfif>
</Cfloop>

<cflocation url="/app/contacts-import/?uploadid=#new_uploadid#">

