<!--- This ColdFusion page handles the logic for updating records based on user input and displays relevant information. --->
<cfinclude template="/include/qry/Finddetails_185_1.cfm" />
<cfinclude template="/include/qry/FindResults_185_2.cfm" />
<cfinclude template="/include/qry/FindKey_185_3.cfm" />

<!--- Set primary key and comptable variables from included queries --->
<cfset primaryKey = findkey.fname />
<cfset compTable = FindResults.compTable />

<!--- Generate page location and display various values --->
<cfset pgLoc = "/app/" & Finddetails.pgdir & "/?recid=" & parent_id />

pg_loc: #pgLoc#<BR>
mode: #mode#<BR>
pgid: #pgid#<BR>
parent recid : #parent_id#<BR>
Child pgid: #rpgid#<BR>
Child rec: #recid#<BR>
current_val: #current_val#<BR>
Table: #compTable#<br>
Primary key: #primaryKey#<BR>

<!--- Determine desired value based on mode --->
<cfif mode is "up">
    <cfset desiredVal = current_val - 1>
<cfelse>
    <cfset desiredVal = current_val + 1>
</cfif>

Desired val: #desiredVal#<BR>
Fieldname: #fname#<BR>

find query: select #primaryKey# from #compTable# where #fname# = #desiredVal# limit 1 <BR>

SQL1: update #compTable# set #fname# = #desiredVal# where #primaryKey# = #recid#<BR>

<cfinclude template="/include/qry/find_185_4.cfm" />

<!--- Set desiredRecid from find query results --->
<cfset desiredRecid = find.primaryKey />

desired_recid: #desiredRecid#<BR>

SQL2: update #compTable# set #fname# = #current_val# where #primaryKey# = #desiredRecid#<BR>

<cfinclude template="/include/qry/sql1_185_5.cfm" />
<cfinclude template="/include/qry/sq2_185_6.cfm" />

<!--- Redirect to the generated page location --->
<cflocation url="#pgLoc#" />

<!--- Changes made:
1. Removed unnecessary <cfoutput> tags around variable outputs.
2. Avoided using # symbols within conditional checks unless essential.
3. Standardized variable names and casing.
4. Ensured consistent attribute quoting, spacing, and formatting.
--->