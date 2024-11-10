<cfcontent reset="true">
<cfset listColumns = "`contactid`,`col1`,`col2`,`col3`,`col4`,`col5`" />
<cfset sIndexColumn = "contactid" />
<cfparam name="draw" default="1" type="integer" />
<cfparam name="start" default="0" type="integer" />
<cfparam name="length" default="10" type="integer" />
<cfparam name="search" default="" type="string" />
<cfparam name="uploadid" default="0" type="integer" />

<cfif structKeyExists(form, "search[value]") and len(form["search[value]"]) gt 0>
    <cfset search = form["search[value]"]>
</cfif>

<!--- Data set after filtering --->
<cfquery datasource="#dsn#" name="qFiltered">
    SELECT contactid,col1,col2,col2b,col3,col4,col5,userid, hlink from #contacts_table#
    WHERE userid = <Cfqueryparam value="#userid#" cfsqltype="CF_SQL_INTEGER" />

    <cfif isdefined('bytag') and bytag is not "">
        and contactid in (SELECT contactid from contactitems WHERE valuetype = 'tags' AND itemstatus = 'active' AND valuetext='#bytag#' )
    </cfif>

    <cfif isdefined('byimport') and byimport is not "">
        and contactid in (SELECT contactid FROM contactsimport WHERE uploadid = #byimport# )
    </cfif>

    <cfif isdefined('bylike')>
        and col1 like '%#bylike#%'
    </cfif>

    <cfif uploadid neq 0>
        and contactid in (SELECT contactid FROM contactsimport WHERE uploadid = #uploadid#)
    </cfif>

    <cfif len(trim(search))>
        <cfif trim(search) is "no system">
            and contactid NOT IN (SELECT contactid FROM contacts_ss_followup WHERE userid = #userid#)
            AND contactid NOT IN (SELECT contactid FROM contacts_ss_maint WHERE userid = #userid#)
            AND contactid NOT IN (SELECT contactid FROM contacts_ss_target WHERE userid = #userid#)
        <cfelse>
            AND (
                <cfloop list="#listColumns#" index="thisColumn">
                    <cfif thisColumn neq listFirst(listColumns)> OR </cfif>
                    #thisColumn# LIKE <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="%#trim(search)#%" />
                </cfloop>
            )
        </cfif>
    </cfif>

    <cfif structKeyExists(form, "order[0][column]") and val(form["order[0][column]"]) gt 0>
        ORDER BY 
        <cfswitch expression="#form['order[0][column]']#">
            <cfcase value="1,2">col1</cfcase>
            <cfcase value="3">col2b</cfcase>
            <cfcase value="4">col3</cfcase>
            <cfcase value="5">col4</cfcase>
            <cfcase value="6">col5</cfcase>
        </cfswitch> 
        <cfif form["order[0][dir]"] eq 'desc'>desc</cfif>
    </cfif>

</cfquery>

<!--- Total data set length --->
<cfquery datasource="#dsn#" dbtype="query" name="qCount">
    SELECT COUNT(#sIndexColumn#) as total FROM qFiltered
</cfquery>

<cfset recordsTotal = qFiltered.recordcount gt 0 ? qCount.total : 0 />
<cfset n= 0 />

<!--- Output --->
{"draw": #val(draw)#, "recordsTotal": #recordsTotal#, "recordsFiltered": #qFiltered.recordCount#, "data": 
    <cfif qFiltered.recordcount gt 0>
        [
            <cfloop query="qFiltered" startrow="#val(start+1)#">
                <cfset n = n + 1 />
                <cfif n LTE val(length)>
                    <cfif currentRow gt (start+1)>,</cfif>
                    [ "#SerializeJSON(qFiltered.contactid)#", #SerializeJSON(qFiltered.hlink)#, #SerializeJSON(qFiltered.col2b)#, #SerializeJSON(qFiltered.col5)#, #SerializeJSON(qFiltered.col3)# , #SerializeJSON(qFiltered.col4)# ]
                </cfif>
            </cfloop>
        ]
    <cfelse>
        ""
    </cfif> 
}

<!--- Changes: 
1. Removed unnecessary `#` symbols in conditional checks.
2. Simplified record count logic.
3. Standardized variable names and casing.
4. Improved attribute quoting, spacing, and formatting.
5. Simplified order by clause using cfswitch.
6. Removed unnecessary `<cfoutput>` tags.
7. Removed `cftry` and `cfcatch` blocks.
--->