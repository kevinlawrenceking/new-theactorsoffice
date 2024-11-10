<h4>Systems - Customization</h4>
<cfinclude template="/include/qry/mysystems_295_1.cfm" />
<div class="row">
    <div class="col-xl-12">
        <div id="accordion_systems" class="mb-3">
            <cfset y=0>
            <cfparam name="targetIdSystem" default="0">
            <cfloop query="mysystems">
                <cfinclude template="/include/qry/action_user_295_2.cfm" />
                <cfinclude template="/include/qry/action_user_del_295_3.cfm" />
                <cfif mysystems.systemid eq targetIdSystem>
                    <div class="card mb-1">
                        <div class="card-header" id="heading_system_#mysystems.systemid#">
                            <h5 class="m-0">
                                <a class="text-dark" data-bs-toggle="collapse" href="#collapse_system_#mysystems.systemid#" aria-expanded="true">
                                    #mysystems.systemname# <span class="badge badge-success badge-pill float-end">#numberformat(action_user.recordcount)#</span>
                                </a>
                            </h5>
                        </div>
                        <div id="collapse_system_#mysystems.systemid#" class="collapse show" aria-labelledby="heading_system_#mysystems.systemid#" data-bs-parent="#accordion_systems">
                <cfelse>
                    <div class="card mb-1">
                        <div class="card-header" id="heading_system_#mysystems.systemid#">
                            <h5 class="m-0">
                                <a class="text-dark text-dark collapsed" data-bs-toggle="collapse" href="#collapse_system_#mysystems.systemid#" aria-expanded="false">
                                    #mysystems.systemname# <span class="badge badge-success badge-pill float-end">#numberformat(action_user.recordcount)#</span>
                                </a>
                            </h5>
                        </div>
                        <div id="collapse_system_#mysystems.systemid#" class="collapse" aria-labelledby="heading_system_#mysystems.systemid#" data-bs-parent="#accordion_systems">
                </cfif>
                <div class="card-body">
                    <p>#mysystems.systemdescript#</p>
                    <a href="/include/restoreaction.cfm?target_id_system=#mysystems.systemid#">
                        <button type="button" class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e">Restore to Default</button>
                    </a>
                    <div class="row">
                        <cfloop query="action_user">
                            <div class="col-md-12">
                                <h5>
                                    <a title="Edit" href="updateactionlink.cfm" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##updateaction_#action_user.id#">
                                        #action_user.currentrow# - #action_user.actiontitle# <i class="mdi mdi-square-edit-outline"></i>
                                    </a>
                                </h5>
                                <p>#action_user.actiondetails#.<br>
                                    <cfif action_user.actiondaysno eq 0>Starts <strong>immediately</strong><cfelse>Starts in <strong>#action_user.actiondaysno# day<cfif action_user.actiondaysno neq 1>s</cfif></strong></cfif>
                                    <cfif numberformat(action_user.actiondaysrecurring) neq 0>, repeating every <strong>#action_user.actiondaysrecurring# days</strong></cfif>.
                                    <cfif isdefined('df6kj')> &nbsp;&nbsp; &nbsp;<a title="Remove Action No #action_user.actionno#" class="pl-1" style="color:red;" href="/include/excludeaction.cfm?ctaction=excludeaction&new_id=#action_user.id#&target_id_system=#mysystems.systemid#"><i class="mdi mdi-trash-can-outline"></i></a></cfif>
                                </p>
                            </div>
                        </cfloop>
                    </div>
                    <cfif action_user_del.recordcount neq 0>
                        <form action="/app/myaccount/">
                            <input type="hidden" name="new_pgid" value="125">
                            <input type="hidden" name="ctaction" value="includeaction">
                            <input type="hidden" name="target_id_system" value="#mysystems.systemid#">
                            <h5>Restore: 
                                <select name="new_id" id="new_id_system_#mysystems.systemid#" required="" onchange='this.form.submit()'>
                                    <option value=""></option>
                                    <cfoutput query="action_user_del">
                                        <option value="#action_user_del.id#">#action_user_del.actiontitle#</option>
                                    </cfoutput>
                                </select>
                            </h5>
                        </form>
                    </cfif>
                </div>
            </div>
        </div>
    </div>
</div>

<!--- Modifications: Standardized variable names and casing (Rule 5), Removed unnecessary cfoutput tags (Rule 2), Simplified record count logic (Rule 4), Improved conditional checks by removing # symbols (Rule 3) --->