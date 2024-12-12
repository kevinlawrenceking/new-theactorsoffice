<cfparam name="devicetype" defaul="" />
<cfinclude template="/include/qry/qry_block_1_1.cfm"/>




            <cfif #t2# is "1">

              <Cflocation url="/app/contact/?contactid=#contactid#&new_pgid=122"/>

            </cfif>

            <cfparam name="t3" default="0"/>

            <cfif #t3# is "1">

              <Cflocation url="/app/contact/?contactid=#contactid#&new_pgid=124"/>

            </cfif>

            <cfparam name="t7" default="0"/>

            <cfif #t7# is "1">

              <Cflocation url="/app/contact/?contactid=#contactid#&new_pgid=125"/>

            </cfif>

