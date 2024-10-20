<cfsetting enablecfoutputonly="true">
<cfcontent reset="true">

<!--- This page processes search requests and returns filtered data in JSON format. --->

<!--- Safeguard for search[value] --->
<cfif structKeyExists(form, "search[value]")>
    <cfset search = form["search[value]"]>
<cfelse>
    <cfset search = "">
</cfif>

<cfset listColumns = "`contactid`,`col1`,`col2`,`col3`,`col4`,`col5`" />
<cfset sIndexColumn = "contactid" />
<cfparam name="draw" default="1" type="integer" />
<cfparam name="start" default="0" type="integer" />
<cfparam name="length" default="10" type="integer" />
<cfparam name="uploadid" default="0" type="integer" />

<!--- Include filtered query --->
<cfinclude template="/include/qry/qFiltered_79_1.cfm" />

<!--- Count query --->
<cfinclude template="/include/qry/qCount_77_2.cfm" />

<!--- Record total logic --->
<cfset recordsTotal = (qFiltered.recordcount gt 0) ? qCount.total : 0 />
<cfset n = 0 />

<cfoutput>
{
    "draw": #val(draw)#,
    "recordsTotal": #recordsTotal#,
    "recordsFiltered": #qFiltered.recordCount#,
    "data": [
        <!--- Loop through filtered query results --->
        <cfloop query="qFiltered" startrow="#val(start+1)#">
            <cfif currentRow gt (start+1)>,</cfif>
            [
                "#SerializeJSON(qFiltered.contactid)#",
                #SerializeJSON(qFiltered.hlink)#,
                #SerializeJSON(qFiltered.col2b)#,
                #SerializeJSON(qFiltered.col5)#,
                #SerializeJSON(qFiltered.col3)#,
                #SerializeJSON(qFiltered.col4)#
            ]
        </cfloop>
    ]
}
</cfoutput>

