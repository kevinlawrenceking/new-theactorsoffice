
<cftry>
    <cfset findit = createObject("component", "services.EssenceService").SELessences_24282(new_essence=new_essence, userid=userid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in findit_287_8.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
