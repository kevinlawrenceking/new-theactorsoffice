
<cftry>
    <cfset result = createObject("component", "services.GenreAuditionService").deleteaudgenres_audition_xref(ID=new_audroleid)>
    <cfif not result>
        <cflog file="errorLog" text="[Error in delete_287_3.cfm] Failed to delete record with ID #new_audroleid#">
    </cfif>
<cfcatch>
    <cflog file="errorLog" text="[Error in delete_287_3.cfm] #cfcatch.message# - #cfcatch.detail#">
</cfcatch>
</cftry>
