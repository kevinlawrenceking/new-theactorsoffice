<cfparam name="deleteaction" default="0" /> 
<cfset ActionUserService = createObject("component", "services.ActionUserService")>
<Cfoutput>
  UPDATE actionusers_tbl
      SET
      <cfif actionDaysNo gt 0>
        actionDaysNo = #actionDaysNo#
      </cfif>

        <cfif actionDaysRecurring neq "">
            ,actionDaysRecurring = <cfif actionDaysRecurring neq "0" AND len(trim(actionDaysRecurring))>
          #actionDaysRecurring#
        <Cfelse>
            NULL
        </cfif></cfif>
      
      ,isDeleted = #deleteaction#
      
      WHERE 1=1 
      
        <cfif id gt 0>
            AND id = #id#
        </cfif>

        <cfif userid gt 0>
            AND userid = #userid#
        </cfif>

        <cfif 0 gt 0 and 0 neq "">
            AND actionid IN (
            SELECT actionid
            FROM fuactions
            WHERE systemid = 0
        )
        </cfif>
</cfoutput>
<cfabort>
<cfset ActionUserService.updateActionUsers(
    id = new_id,
    actionDaysNo = actionDaysNo,
    isDeleted = deleteaction,
    actionDaysRecurring = actionDaysRecurring,
    systemid = 0
)>