<cfset debug = "N" />
<cfparam name="focusId" default="" />

<!--- Include necessary scripts and templates --->
<script src="/app/assets/js/selectize.min.js"></script>
<cfinclude template="/include/qry/audition.cfm" />
<cfinclude template="/include/qry/audDialectsUserSel.cfm" />
<cfinclude template="/include/qry/essenceSel4701.cfm" />
<cfinclude template="/include/qry/audRoleTypesSel.cfm" />
<cfinclude template="/include/qry/myTeam4991.cfm" />
<script src="/app/assets/js/jquery.chained.js"></script>

<p>Enter the information below and press the update button to continue.</p>

<!--- Form for updating role information --->
<form action="/include/roleUpdateForm2.cfm" method="post" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <input type="hidden" name="audProjectId" value="#audProjectId#" />
    <input type="hidden" name="newCatId" value="#newAudCatId#" />
    <input type="hidden" name="newAudRoleId" value="#audRoleId#" />
    <input type="hidden" name="secId" value="176" />
    <input type="hidden" name="userId" value="#userId#" />

    <div class="row">
        <div class="form-group col-md-6 col-sm-12">
            <label for="newAudRoleName">Role Name <span class="text-danger">*</span></label>
            <input class="form-control" type="text" id="newAudRoleName" autocomplete="off" required data-parsley-required data-parsley-error-message="Role Name is required" name="newAudRoleName" value="#roleDetails.audRoleName#" placeholder="Role Name">
        </div>
    </div>

    <div class="form-group col-md-6 col-sm-12">
        <!--- Check if category ID is 5 and set role type accordingly --->
        <cfif newAudCatId IS "5">
            <input type="hidden" name="newAudRoleTypeId" value="33" />
        <cfelse>
            <label for="newAudRoleTypeId">Role Type <span class="text-danger">*</span></label>
            <select id="newAudRoleTypeId" name="newAudRoleTypeId" class="form-control" data-parsley-required data-parsley-error-message="Role Type is required">
                <option value="">--</option>
                <cfoutput query="audRoleTypesSel">
                    <cfif audRoleTypesSel.id is roleDetails.audRoleTypeId>
                        <option value="#audRoleTypesSel.id#" selected>#audRoleTypesSel.name#</option>
                    <cfelse>
                        <option value="#audRoleTypesSel.id#">#audRoleTypesSel.name#</option>
                    </cfif>
                </cfoutput>
            </select>
        </cfif>
    </div>

    <div class="form-group col-md-12">
        <label for="projDescription">Character Description </label>
        <textarea class="form-control" type="text" id="newProjCharDescription" name="newCharDescription" placeholder="Character Description ">#roleDetails.charDescription#</textarea>
        <div class="invalid-feedback"> Please enter a Character Description </div>
    </div>

    <!--- Check if there are dialects available for the user --->
    <cfif audDialectsUserSel.recordCount is 0>
        <input type="hidden" name="newAudDialectId" value="#roleDetails.audDialectId#" />
    <cfelse>
        <div class="form-group col-md-6">
            <label for="newAudDialectId">Dialect</label>
            <select class="form-control" name="newAudDialectId" id="newAudDialectId" onchange="if (this.value=='CustomDialect'){this.form['CustomDialect'].style.visibility='visible',this.form['CustomDialect'].required=true} else {this.form['CustomDialect'].style.visibility='hidden',this.form['CustomDialect'].required=false};">
                <option value="">--</option>
                <option value="CustomDialect">***ADD CUSTOM</option>
                <cfoutput query="audDialectsUserSel">
                    <cfif roleDetails.audDialectId is audDialectsUserSel.id>
                        <option value="#audDialectsUserSel.id#" Selected data-chained="#audDialectsUserSel.audCatId#">#audDialectsUserSel.name#</option>
                    <cfelse>
                        <option value="#audDialectsUserSel.id#" data-chained="#audDialectsUserSel.audCatId#">#audDialectsUserSel.name#</option>
                    </cfif>
                </cfoutput>
            </select>
            <div class="invalid-feedback"> Please select a Dialect. </div>
        </div>

        <div class="form-group col-md-6" id="CustomDialects" style="visibility:hidden;">
            <label for="CustomDialect">Custom Dialect</label>
            <input class="form-control" type="text" id="CustomDialect" name="CustomDialect" value="" placeholder="Enter a Custom Dialect">
        </div>
    </cfif>

    <!--- Conditional styling based on source ID --->
    <style>
        #hiddenDiv, #hiddenDivs, #hiddenDivss, #hiddenDivx {
            display: none;
        }
    </style>

    <cfif roleDetails.audSourceId is "2">
        <style> #hiddenDivss { display: block; } </style>
    </cfif>

    <div class="form-group col-md-6">
        <label for="newAudSourceId">Source </label>
        <select class="form-control" name="newAudSourceId" id="newAudSourceId" onChange="showDiv('hiddenDiv', this);showDiv('hiddenDivs', this);showDiv('hiddenDivss', this);requiredDiv('requireDiv', this);">
            <option value="">--</option>
            <cfoutput query="audSourcesSel">
                <cfif roleDetails.audSourceId is audSourcesSel.id>
                    <option value="#audSourcesSel.id#" selected>#audSourcesSel.name#</option>
                <cfelse>
                    <option value="#audSourcesSel.id#">#audSourcesSel.name#</option>
                </cfif>
            </cfoutput>
        </select>
        <div class="invalid-feedback"> Please select a Source. </div>
    </div>

    <!--- Include necessary scripts and templates --->
    <cfinclude template="/include/qry/openCalls2861.cfm" />
    <cfinclude template="/include/qry/referrals2863.cfm" />
    <cfinclude template="/include/qry/subSites2865.cfm" />
    <cfinclude template="/include/qry/ranges2866.cfm" />
    <cfinclude template="/include/qry/vocals2868.cfm" />
    <cfinclude template="/include/qry/essences28610.cfm" />
    <cfinclude template="/include/qry/findIt28612.cfm" />

    <!--- Include necessary scripts and templates based on conditions --->
    <cfif roleDetails.audSourceId is "4">
        <cfinclude template="/include/qry/openCallsDiv.cfm" />
    </cfif>

    <cfif roleDetails.audSourceId is "1">
        <cfinclude template="/include/qry/myTeamDiv.cfm" />
    </cfif>

    <cfif roleDetails.audSourceId is "3">
        <cfinclude template="/include/qry/referralsDiv.cfm" />
    </cfif>

    <cfif roleDetails.audSourceId is "2">
        <cfinclude template="/include/qry/subSitesDiv.cfm" />
    </cfif>

    <!--- Include necessary scripts and templates based on conditions --->
    <cfif projectDetails.audCatId is "5">
        <cfinclude template="/include/qry/vocalsDiv.cfm" />
    </cfif>

    <!--- Include necessary scripts and templates --->
    <cfinclude template="/include/qry/essencesDiv.cfm" />

    <!--- Include necessary scripts and templates based on conditions --->
    <cfif int(findIt.recordCount) is not 0 AND (newAudCatId is not "5" OR (newAudCatId is "5" AND newSubCatId is "34"))>
        <cfinclude template="/include/qry/genresDiv.cfm" />
    </cfif>

    <div class="form-group text-center col-md-12">
        <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: #406e8e; border: #406e8e;" type="submit">Update</button>
    </div>
</form>

<script src="/app/assets/js/libs