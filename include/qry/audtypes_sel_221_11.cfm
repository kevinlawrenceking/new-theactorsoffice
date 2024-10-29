
<cftry>
    <cfset audtypes_sel = createObject("component", "services.AuditionTypeService").getAudtypes(new_audcatid)>
    <cfcatch type="any">
        <cflog text="[Error in audtypes_sel_221_11.cfm]: #cfcatch.message#" file="errorLog">
    </cfcatch>
</cftry>
