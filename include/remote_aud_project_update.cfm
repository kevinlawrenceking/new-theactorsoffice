<!--- This ColdFusion page handles the audition project update form, including various selections and inputs related to the project details. --->
<cfset debugMode = "N" />

<!--- Include necessary query templates for project details and selections --->
<cfinclude template="/include/qry/auditionProjectDetails.cfm" />
<cfinclude template="/include/qry/audCategoriesSel.cfm" />
<cfinclude template="/include/qry/audSubCategoriesSel.cfm" />
<cfinclude template="/include/qry/audUnionsSel.cfm" />
<cfinclude template="/include/qry/audNetworksUserSel.cfm" />
<cfinclude template="/include/qry/audTonesUserSel.cfm" />
<cfinclude template="/include/qry/audContractTypesSel.cfm" />
<cfinclude template="/include/qry/castingDirectorsSel.cfm" />

<cfset debugMode = "N" />

<script src="/app/assets/js/jquery.chained.js"></script>

<!--- Form for updating audition project details --->
<form action="/include/remote_aud_project_update2.cfm" method="post" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
    <input type="hidden" name="audProjectId" value="#audProjectId#" />
    <input type="hidden" name="newUserId" value="#userId#" />
    <input type="hidden" name="newAudProjectId" value="#audProjectId#" />
    <input type="hidden" name="secId" value="#secId#" />
    <input type="hidden" name="oldToneId" value="#auditionProjectDetails.toneId#" />
    <input type="hidden" name="audSubCatId" value="#auditionProjectDetails.audSubCatId#" />
    <input type="hidden" name="oldNetworkId" value="#auditionProjectDetails.networkID#" />
    <input type="hidden" name="audCatId" value="#auditionProjectDetails.audCatId#" />
    <input type="hidden" name="userId" value="#userId#" />

    <div class="row">
        <div class="form-group col-md-12">
            <h4>Category: #auditionProjectDetails.audCatName# - #auditionProjectDetails.audSubCatName#</h4>
        </div>

        <cfoutput query="auditionProjectDetails">
            <div class="form-group col-md-12">
                <label for="projName">Project Name (Title)<span class="text-danger">*</span></label>
                <input class="form-control" type="text" id="projName" name="newProjName" value="#projName#" placeholder="Project Name (Title)" required data-parsley-required data-parsley-error-message="Project Name is required">
                <div class="invalid-feedback"> Please enter a Project Name (Title). </div>
            </div>

            <div class="form-group col-md-12">
                <label for="projDescription">Project Description / Logline</label>
                <textarea class="form-control" type="text" style="min-height:160px;" id="projDescription" name="newProjDescription" rows="4" placeholder="Project Description ">#projDescription#</textarea>
                <div class="invalid-feedback"> Please enter a Project Description or logline. </div>
            </div>

            <input type="hidden" name="oldContactId" value="#contactId#" />
        </cfoutput>

        <div class="form-group col-sm-12">
            <label for="newContactId">Casting Director </label>
            <select id="newContactId" class="form-control" name="newContactId">
                <option value="0">--</option>
                <cfoutput query="castingDirectorsSel">
                    <option value="#id#" <cfif id is auditionProjectDetails.contactId> Selected </cfif>>#name#</option>
                </cfoutput>
            </select>
        </div>

        <!--- Check if there are any networks available --->
        <cfif audNetworksUserSel.recordCount is 0>
            <input type="hidden" name="newNetworkID" value="#auditionProjectDetails.networkId#" />
        <cfelse>
            <div class="form-group col-md-6">
                <label for="newNetworkID">Network</label>
                <select class="form-control" name="newNetworkID" id="newNetworkID" onchange="if (this.value=='CustomNetwork'){this.form['CustomNetwork'].style.visibility='visible',this.form['CustomNetwork'].required=true} else {this.form['CustomNetwork'].style.visibility='hidden',this.form['CustomNetwork'].required=false};">
                    <option value="">--</option>
                    <option value="CustomNetwork">***ADD CUSTOM</option>
                    <cfoutput query="audNetworksUserSel">
                        <option value="#id#" data-chained="#audCatId#" <cfif auditionProjectDetails.networkID is id> Selected </cfif>>#name#</option>
                    </cfoutput>
                </select>
                <div class="invalid-feedback"> Please select a Network. </div>
            </div>

            <div class="form-group col-md-6" id="CustomNetworks" style="visibility:hidden;">
                <label for="CustomNetwork">Custom Network</label>
                <input class="form-control" type="text" id="CustomNetwork" name="CustomNetwork" value="" placeholder="Enter a Custom Network">
            </div>
        </cfif>

        <!--- Check if there are any tones available --->
        <cfif audTonesUserSel.recordCount is 0>
            <input type="hidden" name="newToneID" value="#auditionProjectDetails.toneId#" />
        <cfelse>
            <div class="form-group col-md-6">
                <label for="newToneID">Style / Format</label>
                <select class="form-control" name="newToneID" id="newToneID" onchange="if (this.value=='Custom'){this.form['Custom'].style.visibility='visible',this.form['Custom'].required=true} else {this.form['Custom'].style.visibility='hidden',this.form['Custom'].required=false};">
                    <option value="">--</option>
                    <option value="Custom">***ADD CUSTOM</option>
                    <cfoutput query="audTonesUserSel">
                        <option value="#id#" <cfif auditionProjectDetails.toneID is id> Selected </cfif>>#name#</option>
                    </cfoutput>
                </select>
                <div class="invalid-feedback"> Please select a Style / Format. </div>
            </div>

            <div class="form-group col-md-6" id="Custom" style="visibility:hidden;">
                <label for="newCustom">Custom Tone</label>
                <input class="form-control" type="text" id="newCustom" name="Custom" value="" placeholder="Enter a Custom Tone">
            </div>
        </cfif>

        <!--- Check if there are any unions available --->
        <cfif audUnionsSel.recordCount is 0>
            <input type="hidden" name="newUnionID" value="#auditionProjectDetails.unionId#" />
        <cfelse>
            <div class="form-group col-md-6">
                <label for="newUnionID">Union</label>
                <select class="form-control" name="newUnionID" id="newUnionID">
                    <option value="">--</option>
                    <cfoutput query="audUnionsSel">
                        <option value="#id#" data-chained="#audCatId#" <cfif auditionProjectDetails.unionID is id> Selected </cfif>>#name#</option>
                    </cfoutput>
                </select>
                <div class="invalid-feedback"> Please select a Union. </div>
            </div>
        </cfif>

        <!--- Check if there are any contract types available --->
        <cfif audContractTypesSel.recordCount is 0>
            <input type="hidden" name="newContractTypeId" value="#auditionProjectDetails.contractTypeId#" />
        <cfelse>
            <div class="form-group col-md-6">
                <label for="newContractTypeID">Contract Type</label>
                <select class="form-control" name="newContractTypeID" id="newContractTypeID">
                    <option value="">--</option>
                    <cfoutput query="audContractTypesSel">
                        <option value="#id#" data-chained="#audCatId#" <cfif auditionProjectDetails.contractTypeID is id> Selected </cfif>>#name#</option>
                    </cfoutput>
                </select>
                <div class="invalid-feedback"> Please select a Contract Type. </div>
            </div>
        </cfif>

        <div class="form-group text-center col-md-12">
            <button class="btn btn-xs btn-primary waves-effect mb-2 waves-light" style="background-color: ##406e8e; border: ##406e8e;" type="submit">Update</button