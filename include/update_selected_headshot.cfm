<cfparam name="mediaid" default="" />
<cfparam name="audprojectid" default="" />
<cfparam name="userid" default="#session.userid#" />

<cfif mediaid neq "" AND audprojectid neq "">
    <!--- Delete existing selection --->
    <cfinclude template="/include/qry/ins_252_1.cfm" />

    <!--- Insert new headshot selection --->
    <cfinclude template="/include/qry/ins_252_2.cfm" />

    <!--- Return JSON response --->
    <cfoutput>
        {"status": "success", "message": "Headshot updated successfully."}
    </cfoutput>
<cfelse>
    <cfoutput>
        {"status": "error", "message": "Invalid selection."}
    </cfoutput>
</cfif>
