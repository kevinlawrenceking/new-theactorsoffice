    <Cfif #calendtime# is "00:00:00">

        <cfset calendtime="23:59:59" />

    </cfif>

    

<cfinclude template="/include/qry/update_cal.cfm" />

<Cflocation url="/app/myaccount/?new_pgid=124&t4=1" />