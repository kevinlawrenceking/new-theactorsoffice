<cfset contactItemService = createObject("component", "services.ContactItemService")>

<cfset findscope = contactItemService.SELfindscope_24712(

    contactid = contactid,        
    userid = userid         
) />

<cfif #findscope.recordcount# is "1">

<cfset new_systemscope = "Casting Director" />
    
<cfelse>
   <cfset new_systemscope = "Industry" /> 
    
</cfif>       