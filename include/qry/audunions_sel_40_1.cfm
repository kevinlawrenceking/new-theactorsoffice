
<cftry>
    <cfset var auditionUnionService = createObject("component", "/services/AuditionUnionService")>
    <cfset var audunions_sel = auditionUnionService.SELaudunions(
        new_countryid = new_countryid,
        new_audcatid = new_audcatid
    )>
    <!--- Additional code outside of the cfquery block remains unchanged --->
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in audunions_sel_40_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
