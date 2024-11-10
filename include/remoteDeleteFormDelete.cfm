<cfinclude template="rpg_load.cfm" />

<cfparam name="oldValue" default="" />
<cfparam name="recordName" default="" />
<cfparam name="newValue" default="" />
<cfparam name="updateName" default="" />
<cfparam name="recId" default="0" />
<cfparam name="updateDetails" default="" />
<cfparam name="loginName" default="" />
<cfparam name="t1" default="0" />
<cfparam name="t2" default="0" />
<cfparam name="t3" default="0" />
<cfparam name="t4" default="0" />
<cfparam name="contactId" default="0" />

<cfparam name="userId" default="#userid#" />
<cfparam name="compId" default="#rpg_compid#" />
<cfparam name="compTable" default="#rpg_comptable#" />
<cfparam name="recName" default="#fid#" />
<cfparam name="compName" default="#rpg_compname#" />

<!--- Include delete query template for specific operation --->
<cfinclude template="/include/qry/delete_233_1.cfm" />

<!--- Check if RPG ID is 40 and include additional delete query if true --->
<cfif rpgid is "40">
    <cfinclude template="/include/qry/del_233_2.cfm" />
</cfif>

<cfset returnPage = "/app/#rpg_compDir#/" />

<!--- Redirect to the specified location with parameters --->
<cflocation url="/app/#pgDir#/?contactid=#contactId#&t1=#t1#&t2=#t2#&t3=#t3#&t4=#t4#" />

<!--- Changes: 
1. Standardized variable names and casing.
2. Removed unnecessary <cfoutput> tags around variable outputs.
3. Avoided using # symbols within conditional checks unless essential.
--->