
<cftry>
    <cfset findtype = createObject("component", "services.AuditionTypeService").SELaudtypes_24526(new_audtypeid=new_audtypeid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findtype_365_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching audio type" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
