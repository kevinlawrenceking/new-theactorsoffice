<!--- This ColdFusion page processes various queries and updates based on the debug mode. --->

<cfset dbug = "N">

<!--- Check if debugging is enabled and output the current time. --->
<cfif #dbug# is "Y">
    <cfoutput>
        #now()#
        <br>
    </cfoutput>
</cfif>

<!--- Include the first query template. --->
<cfinclude template="/include/qry/del_191_1.cfm" />

<!--- Include the second query template. --->
<cfinclude template="/include/qry/x_191_2.cfm" />

<!--- Check if debugging is enabled and output the record count of query x. --->
<cfif #dbug# is "Y">
    <cfoutput>
        #x.recordcount#
        <br>
    </cfoutput>
</cfif>

<!--- Loop through query x and include the update template. --->
<cfloop query="x">
    <cfinclude template="/include/qry/update_191_3.cfm" />
</cfloop>

<!--- Include the third query template. --->
<cfinclude template="/include/qry/y_191_4.cfm" />

<!--- Check if debugging is enabled and output the record count of query y. --->
<cfif #dbug# is "Y">
    <cfoutput>
        #y.recordcount#
        <br>
    </cfoutput>
</cfif>

<!--- Loop through query y and include the update template. --->
<cfloop query="y">
    <cfinclude template="/include/qry/update_191_5.cfm" />
</cfloop>

<!--- Include the fourth query template. --->
<cfinclude template="/include/qry/z_191_6.cfm" />

<!--- Check if debugging is enabled and output the record count of query z. --->
<cfif #dbug# is "Y">
    <cfoutput>
        #z.recordcount#
        <br>
    </cfoutput>
</cfif>

<!--- Loop through query z and include the update template. --->
<cfloop query="z">
    <cfinclude template="/include/qry/update_191_7.cfm" />
</cfloop>

<!--- Include the delete query template. --->
<cfinclude template="/include/qry/delete_191_8.cfm" />

<!--- Check if debugging is enabled and output the current time again. --->
<cfif #dbug# is "Y">
    <cfoutput>
        #now()#
        <br>
    </cfoutput>
</cfif>

<!--- Include the fix query template. --->
<cfinclude template="/include/qry/fix_191_9.cfm" />

<!--- Include the correct query template. --->
<cfinclude template="/include/qry/correct_191_10.cfm" />

<!--- Include the remove query template. --->
<cfinclude template="/include/qry/remove_191_11.cfm" />

<!--- Include the second remove query template. --->
<cfinclude template="/include/qry/remove2_191_12.cfm" />
