
<cftry>
    <cfset resultz = createObject("component", "services.AuditionNetworkUserService").insertaudnetworks_user(
        network = CustomNetwork,
        audcatid = audcatid,
        userid = userid
    )>
    <cfquery name="updateFetchStatus">
        UPDATE your_table_name
        SET isfetch = 1
        WHERE your_condition_here
    </cfquery>
<cfcatch type="any">
    <cfset errorLog = "[Error in insert_277_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
