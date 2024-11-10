<!--- This ColdFusion page processes data for a table, handling search, filtering, and outputting JSON format for front-end consumption. --->
<cfparam name="event_id" default="0" />
<cfcontent reset="true">
<cfset listColumns = "`contactid`,`col1`,`col2`,`col3`,`col4`,`col5`" />
<cfset sIndexColumn = "contactid" />
<cfparam name="draw" default="1" type="integer" />
<cfparam name="start" default="0" type="integer" />
<cfparam name="length" default="10" type="integer" />
<cfparam name="search" default="" type="string" />
<cfparam name="byTag" default="" type="string" />

<!--- Check if search value is provided --->
<cfif len(form["search[value]"]) gt 0>
    <cfset search = form["search[value]"]>
</cfif>

<!--- Data set after filtering --->
<cfinclude template="/include/qry/qFiltered_77_1.cfm" />

<!--- Total data set length --->
<cfinclude template="/include/qry/qCount_77_2.cfm" />

<!--- Determine total records based on filtered results --->
<cfif qFiltered.recordcount gt 0>
    <cfset recordsTotal = qCount.total>
<cfelse>
    <cfset recordsTotal = 0>
</cfif>

<!--- Output JSON response --->
{
    "draw": #val(draw)#,
    "recordsTotal": #recordsTotal#,
    "recordsFiltered": #qFiltered.recordCount#,
    "data": <cfif qFiltered.recordcount gt 0> [
        <cfoutput query="qFiltered" startrow="#val(start + 1)#" maxrows="#val(length)#">
            <cfif currentRow gt (start + 1)>,</cfif>
            [
                "#SerializeJSON(qFiltered.contactid)#",
                #SerializeJSON(qFiltered.hlink)#,
                #SerializeJSON(qFiltered.col2)#,
                #SerializeJSON(qFiltered.col5)#,
                #SerializeJSON(qFiltered.col3)#,
                #SerializeJSON(qFiltered.col4)#
            ]
        </cfoutput>
    ] <cfelse> "" </cfif>
}

<!--- Changes: 
1. Removed unnecessary `<cfoutput>` tags around variable outputs.
2. Standardized variable names and casing.
3. Avoided using `#` symbols within conditional checks unless essential.
4. Simplified record count logic for icons or conditional displays.
5. Ensured consistent attribute quoting, spacing, and formatting.
--->