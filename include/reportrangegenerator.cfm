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
    <cfif #x.rangename# is "Last Year">

        <cfset new_year = year(now()) - 1 />

        <cfoutput>
            <cfset new_rangestart = "#new_year#-01-01" />
            <cfset new_rangeend = "#new_year#-12-31" />
        </cfoutput>

    </cfif>

    <!--- Check for Current Month range name --->
    <cfif #x.rangename# is "Current Month">

        <cfif #current_month# is "12">
            <cfset next_month = 1 />
            <cfset new_year = current_year + 1 />
        </cfif>

        <cfif #current_month# is not "12">
            <cfset next_month = current_month + 1 />
            <cfset new_year = current_year />
        </cfif>

        <cfoutput>
            <cfset next_date = "#new_year#-#next_month#-01" />
   
        <cfset new_rangeend = DateAdd("d", -1, next_date) />
        <cfset new_rangeend = "#dateformat('#new_rangeend#', 'YYYY-MM-dd')#" />


            <cfset new_rangestart = "#current_year#-#current_month#-01" />
        </cfoutput>

    </cfif>

    <!--- Check for Last 3 Months range name --->
    <cfif #x.rangename# is "Last 3 Months">

        <cfset currentDate = now() />
        <cfset newRangeStart = CreateDate(year(currentDate), month(currentDate) - 3, 1) />

        <cfoutput>
            <cfset new_rangeend = "#dateformat('#currentDate#', 'YYYY-MM-dd')#" />
            <cfset newRangeStart = "#dateformat('#newRangeStartx#', 'YYYY-MM-dd')#" />
        </cfoutput>

    </cfif>


    <cfif x.rangename EQ "Last 6 Months">

    <cfset new_rangestart = DateFormat(DateAdd("m", -6, Now()), "YYYY-MM-01")>
    <cfset new_rangeend = Now()>
</cfif>

   

<cfif #dbug# is "Y">
<Cfoutput>
<h2>#x.rangename#</h2>
range id: #rangeid#<BR>
rangestart: #rangestart#<BR>
rangestart: #rangeend#<BR>
</cfoutput>
</cfif>
    <cfinclude template="/include/qry/update2_280_2.cfm" />

</cfloop>
<cfif #CUSTOMSTART# is not "">
<cfinclude template="/include/qry/update2_280_3.cfm" />
</cfif>
<cfset new_rangeend = "" />
<cfset new_rangestart = "" />
