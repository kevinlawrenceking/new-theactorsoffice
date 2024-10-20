
<cftry>
    <cfset result = createObject("component", "/services/EssenceService").insertessences(new_essence, userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_287_9.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
