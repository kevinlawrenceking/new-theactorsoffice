<!--- This ColdFusion page processes report data based on user input and generates report items. --->
<cfparam name="new_rangeid" default="1" />
<cfparam name="anchortag" default="" />
<cfparam name="customstart" default="2022-01-01" />
<cfparam name="customend" default="2100-01-01" />
<cfparam name="new_audsourceid" default="0" />
<cfparam name="new_audsourceidb" default="0" />
<cfparam name="new_audcatid" default="1" />
<cfparam name="refreshdata_yn" default="N" />


<cfoutput>#new_audsourceid#</cfoutput>

<!--- Proceed if the user ID is not "0". --->
<cfif #userid# is not "0">
    <cfinclude template="/include/reportrangegenerator.cfm" />
    <cfset i = 0 />
    <cfinclude template="/include/qry/delete_all_282_1.cfm" />
    <cfinclude template="/include/qry/rangeselected_282_2.cfm" />

    <!--- Set the start date based on the selected range. --->
    <cfif IsDate(rangeselected.rangestart)>
        <cfset new_rangestart = DateFormat(rangeselected.rangestart, "yyyy-mm-dd")>
    <cfelse>
        <!--- Set a very old date as the default value. --->
        <cfset new_rangestart = "1900-01-01">
    </cfif>

    <!--- Set the end date based on the selected range. --->
    <cfif IsDate(rangeselected.rangeend)>
        <cfset new_rangeend = DateFormat(rangeselected.rangeend, "yyyy-mm-dd")>
    <cfelse>
        <!--- Set a future date as the default value. --->
        <cfset new_rangeend = "2100-01-01">
    </cfif>

    <cfinclude template="/include/qry/reportRefresh.cfm" />
</cfif>

<!--- Redirect to the reports page based on the presence of an anchor tag. --->
<cfif #anchortag# is not "">
    <cflocation url="/app/reports/?refresh=n&new_audsourceidb=#new_audsourceidb#&new_audsourceid=#new_audsourceid#&customstart=#customstart#&customend=#customend#&new_rangeid=#new_rangeid#&new_audcatid=#new_audcatid####anchortag#" addtoken="false" />
<cfelse>
    <cflocation url="/app/reports/?refresh=n&new_audsourceidb=#new_audsourceidb#&new_audsourcid=#new_audsourceid#&customstart=#customstart#&customend=#customend#&new_rangeid=#new_rangeid#&new_audcatid=#new_audcatid#" addtoken="false" />
</cfif>
