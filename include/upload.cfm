

<cfset currentURL = cgi.server_name />
<cfset host = ListFirst(currentURL, ".") />

<cfinclude template="/include/qry/INSERT_315_1.cfm" />

<cfset new_uploadid = result.generatedkey />

<cfoutput>
upload id: #new_uploadid#<BR>
    <cfset session.userMediaPath = "C:\home\theactorsoffice.com\wwwroot\#host#-subdomain\media-#host#\users\#userid#" />
</cfoutput>

<!--- Check if the user media path exists, if not, create it --->
<CFIF not DirectoryExists("#session.userMediaPath#")>
    <CFDIRECTORY directory="#session.userMediaPath#" action="create">
</CFIF>

<cffile action="upload" filefield="form.file" destination="#session.userMediaPath#\" nameconflict="MAKEUNIQUE" />

<cfspreadsheet action="read" 
    sheetname="TAO Import Template" 
    src="#session.userMediaPath#\#cffile.serverfile#" 
    query="importdata" 
    columnnames="FirstName,LastName,Tag1,Tag2,Tag3,BusinessEmail,PersonalEmail,WorkPhone,MobilePhone,HomePhone,Company,Address,Address2,City,State,Zip,Country,contactMeetingDate,contactMeetingLoc,Birthday,website,Notes" 
    headerrow="1" />




<cfoutput>
importdata: #importdata.recordcount#<BR>
</cfoutput>


<cfinclude template="/include/qry/find_315_2.cfm" />
<cfoutput>
Contacts imported: #find#<BR>
</cfoutput>

<cfinclude template="/include/qry/x_315_3.cfm" />
<cfoutput>contactimports to loop: #new.recordcount#<BR></cfoutput>
 <cfinclude template="/include/qry/add_315_6.cfm" />


<cfaborT>
<cflocation url="/app/contacts-import/?uploadid=#new_uploadid#">

