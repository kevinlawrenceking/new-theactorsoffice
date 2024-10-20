<!--- This ColdFusion page processes date ranges based on predefined criteria from a query and prepares them for further use. --->

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

        <cfoutput>
            <cfset new_year = "#year(now())#" />
            <cfset new_rangestart = "#new_year#-01-01" />
            <cfset new_rangeend = "#new_year#-12-31" />
        </cfoutput>

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
        </cfoutput>

        <cfset new_rangeend = DateAdd("d", -1, next_date) />
        <cfset new_rangeend = "#dateformat('#new_rangeend#', 'YYYY-MM-dd')#" />

        <cfoutput>
            <cfset new_rangestart = "#current_year#-#current_month#-01" />
        </cfoutput>

    </cfif>

    <!--- Check for Last 3 Months range name --->
    <cfif #x.rangename# is "Last 3 Months">

        <cfset currentDate = now() />
        <cfset newRangeStartx = CreateDate(year(currentDate), month(currentDate) - 3, 1) />

        <cfoutput>
            <cfset new_rangeend = "#dateformat('#currentDate#', 'YYYY-MM-dd')#" />
            <cfset newRangeStart = "#dateformat('#newRangeStartx#', 'YYYY-MM-dd')#" />
        </cfoutput>

    </cfif>

    <!--- Check for Last 6 Months range name --->
    <cfif #x.rangename# is "Last 6 Months">

        <cfset current_month = month(now()) />
        <cfset current_day = day(now()) />

        <cfif #current_month# is "6">
            <cfset six_month = 12 />
            <cfset six_year = last_year />
        <cfelseif #current_month# is "5">
            <cfset six_month = 11 />
            <cfset six_year = last_year />
        <cfelseif #current_month# is "4">
            <cfset six_month = 10 />
            <cfset six_year = last_year />
        <cfelseif #current_month# is "3">
            <cfset six_month = 8 />
            <cfset six_year = last_year />
        <cfelseif #current_month# is "2">
            <cfset six_month = 7 />
            <cfset six_year = last_year />
        <cfelseif #current_month# is "1">
            <cfset six_month = 6 />
            <cfset six_year = last_year />
        <cfelse>
            <cfset six_year = current_year />
            <cfset six_month = current_month - 6 />
        </cfif>

        <cfoutput>
            <cfset new_rangeend = "#dateformat('#now()#', 'YYYY-MM-dd')#" />
            <cfset new_rangestart = "#dateformat('#now()#', '#six_year#-#six_month#-#current_day#')#" />
        </cfoutput>

    </cfif>

    <cfinclude template="/include/qry/update2_280_2.cfm" />

</cfloop>

<cfinclude template="/include/qry/update2_280_3.cfm" />

<cfset new_rangeend = "" />
<cfset new_rangestart = "" />
