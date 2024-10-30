
<cftry>
    <cfset componentPath = "/services/AuditionMediaXRefService" />
    <cfset componentInstance = createObject("component", componentPath) />
    <cfset componentInstance.INSaudmedia_auditions_xref(new_mediaid=new_mediaid, audprojectid=audprojectid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in linkmedia_152_1.cfm]: #cfcatch.message#" />
        <cfthrow message="Error occurred while calling INSaudmedia_auditions_xref." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
