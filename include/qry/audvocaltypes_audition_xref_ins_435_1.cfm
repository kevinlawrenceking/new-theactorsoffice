
<cftry>
    <cfset result = createObject("component", "services.AuditionVocalTypeXRefService").insertAuditionVocalType(new_audRoleID=new_audRoleID, new_vocaltypeid=new_vocaltypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audvocaltypes_audition_xref_ins_435_1.cfm] #cfcatch.message#" type="error">
        <cfthrow message="Error occurred while calling insertAuditionVocalType." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
