<!--- This ColdFusion page handles the audition submission form, including various fields and dynamic visibility of elements based on user input. --->
<cfparam name="rContactId" default="0"/> <!--- Set default value for rContactId --->
<cfparam name="isDirect" default="0"/> <!--- Set default value for isDirect --->

<style>
    /* Styles for hidden divs */
    #hiddenDivs, #hiddenDivs2, #hiddenDivs3, #hiddenDivs4 {
        display: none;
    }

    /* Output text style */
    .output {
        font: 1rem 'Fira Sans', sans-serif;
    }

    /* Fieldset styling */
    fieldset {
        display: block;
        margin-inline-start: 1px;
        margin-inline-end: 1px;
        padding-block-start: 0.35em;
        padding-inline-start: 0.75em;
        padding-inline-end: 0.75em;
        padding-block-end: 0.625em;
        min-inline-size: min-content;
        border-width: 2px;
        border-style: solid; 
        border-color: ##ced4da; 
    }
</style>

<cfset dbug = "N"/> <!--- Initialize debug variable --->

<cfinclude template="/include/fetchLocationService.cfm" /> <!--- Include location service --->
<cfinclude template="/include/qry/audPlatformsUserSel.cfm"/> <!--- Include user selected audition platforms --->
<cfinclude template="/include/qry/cities448_1.cfm"/> <!--- Include cities query --->
<cfinclude template="/include/qry/cat27_1.cfm" />

<cfset newAudCatId = cat.audCatId/> <!--- Set newAudCatId from query result --->

<cfinclude template="/include/qry/audRoleTypesSel27_2.cfm" />
<cfinclude template="/include/qry/audTypesSel27_3.cfm" />
<cfinclude template="/include/qry/castingTypes27_4.cfm" />
<cfinclude template="/include/qry/castingDirectorsSel.cfm"> <!--- Include casting directors selection --->

<cfif isDirect eq 1> <!--- Check if isDirect is 1 --->
    <style>
        #hideDirectBooking {
            display: none;
        }
        .input {
            margin: 0 auto;
        }
    </style>
</cfif>

<style>
    #hiddenDiv {
        display: none;
    }
    .input {
        margin: 0 auto;
    }
</style>

<div class="row">
    <div class="col-xl-6 col-lg-8 col-md-12">
        <div class="card">
            <div class="card-body">
                <form method="post" action="/include/audition-add2.cfm" class="parsley-examples" name="event-form" id="form-event" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate="data-parsley-validate">
                    <input type="hidden" name="new_audStepID" value="1"/>
                    <input type="hidden" name="new_audCatId" value="#cat.audCatId#"/>
                    <input type="hidden" name="new_audSubCatId" value="#cat.audSubCatId#"/>
                    <input type="hidden" name="new_userId" value="#session.userId#"/>
                    <input type="hidden" name="isDirect" value="#isDirect#"/>

                    <cfif isDirect eq 1> <!--- Display Direct Booking header if isDirect is 1 --->
                        <h4 class="col-md-12">Direct Booking</h4>
                    </cfif>

                    <h4 class="col-md-12">
                        Category: #cat.audCatName# - #cat.audSubCatName#
                    </h4>

                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="new_projName">Project Name (Title)<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" id="new_projName" autocomplete="off" required="required" data-parsley-required="data-parsley-required" data-parsley-error-message="Project Name is required" name="new_projName" placeholder="Project Name">
                        </div>

                        <div class="form-group col-md-12">
                            <label for="new_projDescription">Project Description/Logline<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" id="new_projDescription" data-parsley-required="data-parsley-required" name="new_projDescription" error-message="Project Description is required" placeholder="Project Description">
                        </div>

                        <script>
                            function showDivs(divId, element) {
                                document.getElementById(divId).style.display = element.value == 2 ? 'block' : 'none';
                            }

                            function showDivs2(divId, element) {
                                document.getElementById(divId).style.display = element.value == 1 ? 'block' : 'none';
                            }

                            function showDivs3(divId, element) {
                                document.getElementById(divId).style.display = element.value == 0 ? 'block' : 'none';
                            }

                            function showDivs4(divId, element) {
                                console.log("Value: ", element.value, "Type: ", typeof element.value); // Debugging line
                                document.getElementById(divId).style.display = element.value == '0' ? 'none' : 'block';
                            }

                            function showDirectBooking(divId, element) {
                                document.getElementById(divId).style.display = element.value == 23 ? 'none' : 'block';
                            }
                        </script>

                        <div class="form-group col-md-6 col-sm-12">
                            <label for="new_audRoleName">Role Name<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" id="new_audRoleName" autocomplete="off" required="required" data-parsley-required="data-parsley-required" data-parsley-error-message="Role Name is required" name="new_audRoleName" placeholder="Role Name">
                        </div>

                        <cfif newAudCatId eq 5> <!--- Check if newAudCatId is 5 --->
                            <input type="hidden" name="new_audRoleTypeId" value="33"/>
                        <cfelse>
                            <div class="form-group col-md-6 col-sm-12">
                                <label for="new_audRoleTypeId">Role Type</label>
                                <select id="new_audRoleTypeId" name="new_audRoleTypeId" class="form-control" data-parsley-required="data-parsley-required" data-parsley-error-message="Role Type is required">
                                    <option value="">--</option>
                                    <cfoutput query="audRoleTypesSel">
                                        <option value="#audRoleTypesSel.id#">#audRoleTypesSel.name#</option>
                                    </cfoutput>
                                </select>
                            </div>
                        </cfif>

                        <div class="form-group col-md-12">
                            <label for="new_contactId">Casting Director</label>
                            <select id="new_contactId" class="form-control" name="new_contactId" onChange="showDivs4('hiddenDivs4', this);">
                                <option value="">--</option>
                                <option value="0">***ADD NEW***</option>
                                <cfoutput query="castingDirectorsSel">
                                    <option value="#castingDirectorsSel.id#">#castingDirectorsSel.name#</option>
                                </cfoutput>
                            </select>
                        </div>

                        <div id="hiddenDivs4">
                            <div class="row">
                                <fieldset>
                                    <legend>Add New Casting</legend>

                                    <div class="form-group col-md-10">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="casting_info" id="casting_director_known" value="casting_director_known" checked="checked">
                                            <label class="form-check-label" for="casting_director_known">Casting Director known</label>
                                        </div>

                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="casting_info" id="only_company_known" value="only_company_known">
                                            <label class="form-check-label" for="only_company_known">Only company known</label>
                                        </div>
                                    </div>

                                    <div id="CD">
                                        <div class="form-group col-md-6">
                                            <label for="cdFullName">Casting Director</label>
                                            <input class="form-control" type="text" id="cdFullName" name="cdFullName" autocomplete="off" placeholder="Casting Director">
                                            <div id="nameResults"></div>
                                            <div class="invalid-feedback">Please enter a Casting Director.</div>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <div id="cdRole">
                                                <label for="cdType">