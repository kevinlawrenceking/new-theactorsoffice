
<!--- This ColdFusion page handles the insertion of new vocal type and audition role associations into the database. --->

<cftry>
    <cfset result = createObject("component", "/services/AuditionVocalTypeXRefService").insertaudvocaltypes_audition_xref(new_vocaltypeid, new_audroleid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_287_16.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
