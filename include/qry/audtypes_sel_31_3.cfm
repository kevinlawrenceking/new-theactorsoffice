
<cftry>
    <cfset audtypes_sel = createObject("component", "services.AuditionTypeService").getDistinctAudtypes(userid=#userid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audtypes_sel_31_3.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
