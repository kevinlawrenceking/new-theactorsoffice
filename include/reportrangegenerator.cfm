<!--- This ColdFusion page processes date ranges based on predefined criteria from a query and prepares them for further use. --->
<cfset dbug = "Y">
<cfinclude template="/include/qry/x_280_1.cfm" />


<Cfoutput>

    <cfset current_year = "#year(now())#" />
    <cfset current_month = "#month(now())#" />

</Cfoutput>

<cfset last_year = current_year - 1 />

<cfloop query="x">

    <cfset current_rangeid = x.rangeid />

    <!--- Check for Current Year range name --->
    <cfif #x.rangename# is "Current Year">

    <cfif #dbug# is "Y"><cfoutput>x.rangename: #x.rangename#</cfoutput><BR></cfif>
        <cfoutput>
            <cfset new_year = "#year(now())#" />
            <cfset new_rangestart = "#new_year#-01-01" />
            <cfset new_rangeend = "#new_year#-12-31" />
        </cfoutput>
 <cfif #dbug# is "Y"><cfoutput>new_rangestart: #new_rangestart#</cfoutput><BR></cfif>
  <cfif #dbug# is "Y"><cfoutput>new_rangeend: #new_rangeend#</cfoutput><BR></cfif>
   <cfif #dbug# is "Y"><cfoutput>new_year: #new_year#</cfoutput><BR></cfif>
    </cfif>

    <!--- Check for Last Year range name --->
<cfif x.rangename EQ "Last Year">
    <!--- Compute date range for the entire last year --->
    <cfset new_rangestart = CreateDate(Year(Now()) - 1, 1, 1)>
    <cfset new_rangeend = CreateDate(Year(Now()) - 1, 12, 31)>
</cfif>

    <!--- Check for Current Month range name --->
<cfif x.rangename EQ "Current Month">
    <!--- Compute start and end dates for the current month --->
    <cfset new_rangestart = CreateDate(Year(Now()), Month(Now()), 1)>
    <cfset new_rangeend = DateAdd("d", -1, DateAdd("m", 1, new_rangestart))>
</cfif>

    <!--- Check for Last 3 Months range name --->
<cfif x.rangename EQ "Last 3 Months">
    <!--- Compute date range exactly 3 months prior --->
    <cfset new_rangestart = DateAdd("m", -3, Now())>
    <cfset new_rangeend = Now()>

    <!--- Format the dates as 'YYYY-MM-DD' --->
    <cfset new_rangestart = DateFormat(new_rangestart, "YYYY-MM-dd")>
    <cfset new_rangeend = DateFormat(new_rangeend, "YYYY-MM-dd")>
</cfif>



<cfif x.rangename EQ "Last 6 Months">
    <!--- Compute date range as actual date objects --->
    <cfset new_rangestart = DateAdd("m", -6, Now())>
    <cfset new_rangeend = Now()>
</cfif>


   

<cfif #dbug# is "Y">
<Cfoutput>
<h2>#x.rangename#</h2>
range id: #rangeid#<BR>
new_rangestart: #new_rangestart#<BR>
new_rangeend: #new_rangeend#<BR>
</cfoutput>
</cfif>

<cfset new_rangestart = DateFormat(new_rangestart, "YYYY-MM-dd")>
<cfset new_rangeend = DateFormat(new_rangeend, "YYYY-MM-dd")>
 
    <cfinclude template="/include/qry/update2_280_2.cfm" />


</cfloop>
<cfif #CUSTOMSTART# is not "">
<cfinclude template="/include/qry/update2_280_3.cfm" />
</cfif>
<cfset new_rangeend = "" />
<cfset new_rangestart = "" />
