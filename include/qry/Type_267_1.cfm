
<cftry>
    <cfset Type = createObject("component", "/services/AuditionMediaTypeService").SELaudmediatypes_24198(src="account")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Type_267_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
