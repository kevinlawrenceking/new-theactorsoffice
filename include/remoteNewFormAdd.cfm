<!--- This ColdFusion page handles the insertion of data into a specified table and includes various setup processes based on conditions. --->
<cfinclude template="rpg_load.cfm" />

<cfparam name="debug" default="Y" />
<cfparam name="tab1" default="0" />
<cfparam name="tab2" default="0" />
<cfparam name="tab3" default="0" />
<cfparam name="tab4" default="0" />
<cfparam name="contactId" default="0" />

<cfscript>
    <!--- Define new table name and form fields based on RPGAdd structure --->
    newTableName = rpg.compTable;
    newFormFields = valueList(RPGAdd.fname);
</cfscript>

newTableName: #newTableName#<BR>
newFormFields: #valueList(RPGAdd.fname)# /app/#pgDir#/?contactId=#contactId#&tab1=#tab1#&tab2=#tab2#&tab3=#tab3#&tab4=#tab4#

<CFINSERT TABLENAME="#newTableName#" formfields="#newFormFields#" >

<!--- Check if rpgid is equal to "8" and include necessary templates --->
<cfif rpgid is "8">
    <cfinclude template="/include/qry/find_246_1.cfm" />
    <!--- Set the selected user ID from the find query --->
    <cfset selectUserId = find.userId />
    <cfinclude template="/include/user_setup.cfm" />
</cfif>

<!--- Redirect to the specified URL after processing --->
<cflocation url="/app/#pgDir#/?contactId=#contactId#&tab1=#tab1#&tab2=#tab2#&tab3=#tab3#&tab4=#tab4#" />

<!--- Changes: 
1. Standardized variable names and casing.
2. Removed unnecessary `<cfoutput>` tags around variable outputs.
3. Avoided using `#` symbols within conditional checks.
4. Ensured consistent attribute quoting, spacing, and formatting.
--->