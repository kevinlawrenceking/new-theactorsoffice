<!--- This ColdFusion page displays a list of systems with customization options and actions for each system. --->

<h4>Systems - Customization</h4>

<cfinclude template="/include/qry/mysystems_295_1.cfm" />

<div class="row"> <!--- (1) --->
    <div class="col-xl-12"> <!--- (2) --->
        <div id="accordion_systems" class="mb-3"> <!--- (3) --->

            <cfset y=0>
            <cfparam name="target_id_system" default="0">

            <!--- Loop through each system in the mysystems query --->
            <cfloop query="mysystems">

                <cfinclude template="/include/qry/action_user_295_2.cfm" />
                <cfinclude template="/include/qry/action_user_del_295_3.cfm" />

                <!--- Check if the current system matches the target system ID --->
                <cfif #mysystems.systemid# is "#target_id_system#">
                    <div class="card mb-1"> <!--- (4) --->
                        <div class="card-header" id="<cfoutput>heading_system_#mysystems.systemid#</cfoutput>"> <!--- (5) --->
                            <h5 class="m-0">
                                <a class="text-dark" data-bs-toggle="collapse" href="#collapse_system_<cfoutput>#mysystems.systemid#</cfoutput>" aria-expanded="true">
                                    <cfoutput>#mysystems.systemname# <span class="badge badge-success badge-pill float-end">#numberformat(action_user.recordcount)#</span></cfoutput>
                                </a>
                            </h5>
                        </div> <!--- (4) --->

                        <div id="collapse_system_<cfoutput>#mysystems.systemid#</cfoutput>" class="collapse show" aria-labelledby="<cfoutput>heading_system_#mysystems.systemid#</cfoutput>" data-bs-parent="#accordion_systems" style=""> <!--- (5) --->

                <cfelse>

                    <div class="card mb-1"> <!--- (6) --->
                        <div class="card-header" id="<cfoutput>heading_system_#mysystems.systemid#</cfoutput>"> <!--- (7) --->
                            <h5 class="m-0">
                                <a class="text-dark text-dark collapsed" data-bs-toggle="collapse" href="#collapse_system_<cfoutput>#mysystems.systemid#</cfoutput>" aria-expanded="false">
                                    <cfoutput>#mysystems.systemname# <span class="badge badge-success badge-pill float-end">#numberformat(action_user.recordcount)#</span></cfoutput>
                                </a>
                            </h5>
                        </div> <!--- (6) --->

                        <div id="collapse_system_<cfoutput>#mysystems.systemid#</cfoutput>" class="collapse" aria-labelledby="<cfoutput>heading_system_#mysystems.systemid#</cfoutput>" data-bs-parent="#accordion_systems" style=""> <!--- (7) --->

                </cfif>

                <div class="card-body"> <!--- (8) --->
                    <p>
                        <cfoutput>#mysystems.systemdescript#</cfoutput>
                    </p>

                    <cfoutput>
                        <a href="/include/restoreaction.cfm?target_id_system=#mysystems.systemid#">
                            <button type="button" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e">Restore to Default</button>
                        </a>
                    </cfoutput>

                    <div class="row"> <!--- (9) --->
                        <!--- Loop through each action for the current system --->
                        <cfloop query="action_user">
                            <div class="col-md-12"> <!--- (10) --->
                                <cfoutput>
                                    <h5>
                                        <a title="Edit" href="updateactionlink.cfm" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##updateaction_#action_user.id#">
                                            #action_user.currentrow# - #action_user.actiontitle#
                                            <i class="mdi mdi-square-edit-outline"></i>
                                        </a>
                                    </h5>

                                    <p>#action_user.actiondetails#.<br>
                                        <cfif #action_user.actiondaysno# is "0">Starts <strong>immediately</strong>
                                        <cfelse>Starts in <strong>#action_user.actiondaysno# day<cfif #action_user.actiondaysno# is not "1">s</cfif></strong>
                                        </cfif>
                                        <cfif #numberformat(action_user.actiondaysrecurring)# is not "0">, repeating every <strong>#action_user.actiondaysrecurring# days</strong></cfif>.
                                    </p>
                                </cfoutput>
                            </div> <!--- (9) --->
                        </cfloop>
                    </div> <!--- (8) --->

                    <!--- Check if there are any actions to restore --->
                    <cfif #action_user_del.recordcount# is not "0">
                        <form action="/app/myaccount/">
                            <cfoutput>
                                <input type="hidden" name="new_pgid" value="125">
                                <input type="hidden" name="ctaction" value="includeaction">
                                <input type="hidden" name="target_id_system" value="#mysystems.systemid#">
                            </cfoutput>
                            <h5>Restore:
                                <select name="new_id" id="<cfoutput>new_id_system_#mysystems.systemid#</cfoutput>" required="" onchange='this.form.submit()'>
                                    <option value=""></option>
                                    <cfoutput query="action_user_del">
                                        <option value="#action_user_del.id#">#action_user_del.actiontitle#</option>
                                    </cfoutput>
                                </select>
                            </h5>
                        </form>
                    </cfif>
                </div> <!--- (7) --->
            </div> <!--- (5) --->
        </div> <!--- (4) --->
    </div> <!--- (3) --->
</div> <!--- (2) --->
</div> <!--- (1) --->
