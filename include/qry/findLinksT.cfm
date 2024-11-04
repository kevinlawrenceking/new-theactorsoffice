<cfparam name="url.pgid" type="numeric" default="1">

<cfset pageAppLinksService = createObject("component", "services.PageAppLinks")>
<cfset pageLinks = pageAppLinksService.GetPageAppLinks(pgid=url.pgid)>

<cfoutput>
    <cfif pageLinks.recordCount gt 0>
        <ul>
            <cfloop query="pageLinks">
                <li>
                    <a href="#pageLinks.linkurl#" 
                       rel="#pageLinks.rel#" 
                       id="#pageLinks.hrefid#">
                       #pageLinks.linkname#
                    </a>
                </li>
            </cfloop>
        </ul>
    <cfelse>
        <p>No links found for the specified page.</p>
    </cfif>
</cfoutput>
