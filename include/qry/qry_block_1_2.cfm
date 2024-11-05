<!--- ActionUserFetch.cfm - Fetch page to update isdeleted status --->

<!--- Ensure the required parameter new_id is provided in the URL --->
<cfparam name="url.new_id" type="numeric" default="0">

<cfif url.new_id neq 0>
    <!--- Create an instance of the ActionUserService component --->
    <cfset actionUserService = createObject("component", "services.ActionUserService")>

    <!--- Call the UPDactionusers_23923 function to set isdeleted to 0 --->
    <cftry>
        <cfset actionUserService.UPDactionusers_23923(new_id=new_id)>
        <cfoutput>
            <p>User with ID #url.new_id# has been successfully undeleted.</p>
        </cfoutput>
        
        <cfcatch type="any">
            <cfoutput>
                <p>Error undeleting user with ID #url.new_id#: #cfcatch.message#</p>
            </cfoutput>
        </cfcatch>
    </cftry>
<cfelse>
 
</cfif>
