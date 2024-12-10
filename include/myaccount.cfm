<!--- This ColdFusion page handles user account updates, including personal information, address, and settings. --->

<cfparam name="ctaction" default="view" />
<cfparam name="defCountry" default="" />
<cfparam name="usercontactid" default="30" />
<cfset cookie.userid = userid />
<cfset session.pgrtn = "P" />
<cfset pgrtn = "P" />

<cfinclude template="/include/tab_check_account.cfm" />
<cfinclude template="/include/qry/sitetypes_535_1.cfm" />
<cfinclude template="/include/qry/timezones.cfm" />
<cfinclude template="/include/qry/mylinks_159_1.cfm" />
<cfinclude template="/include/qry/actions_159_2.cfm" />

<div id="remoteUpdateAccountf" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" >

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Account & Security</h4>
                <button type="button" class="close" data-bs-dismiss="modal" >
<i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body">
                <cfparam name="t1" default="0" />
                <cfparam name="t2" default="0" />
                <cfparam name="t3" default="0" />
                <cfparam name="t4" default="0" />
                <cfparam name="t5" default="0" />
                <cfparam name="t6" default="0" />

                <form action="/app/myaccount/" method="post" class="parsley-examples" id="account" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
                    <cfoutput>
                        <input type="hidden" name="ctaction" value="update" />
                        <input type="hidden" name="t3" value="1" />
                        <div class="form-group col-md-12">
                            <label for="userFirstName">First Name<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" id="new_userFirstName" name="new_userFirstName" value="#userFirstName#" data-parsley-required data-parsley-error-message="First Name is required" placeholder="Enter your first name" />
                        </div>

                        <div class="form-group col-md-12">
                            <label for="userLastName">Last Name<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" id="new_userLastName" name="new_userLastName" value="#userLastName#" data-parsley-required data-parsley-error-message="Last Name is required" placeholder="Enter your last name" />
                        </div>

                        <div class="form-group col-md-12">
                            <label for="new_AvatarName">Avatar Name<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" id="new_AvatarName" name="new_AvatarName" value="#avatarname#" data-parsley-required data-parsley-error-message="Avatar Name is required" placeholder="Enter your Avatar name" />
                        </div>

                        <div class="form-group col-md-12">
                            <label for="useremail">Email<span class="text-danger">*</span></label>
                            <input class="form-control" name="new_useremail" value="#useremail#" data-parsley-type="email" id="email_address" data-parsley-required data-parsley-trigger="focusout" data-parsley-checkemail data-parsley-checkemail-message="Email Address already Exists" placeholder="Enter your email" />
                        </div>

                        <div class="form-group text-center col-md-12">
                            <button class="btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: ##406e8e; border: ##406e8e;">Update</button>
                        </div>
                    </cfoutput>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="remoteUpdateAccount" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" >

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #f3f7f9;">
                <h4 class="modal-title" id="standard-modalLabel">Account & Security</h4>
                <button type="button" class="close" data-bs-dismiss="modal" >
<i class="mdi mdi-close-thick"></i></button>
            </div>
            <div class="modal-body">
                <cfparam name="new_pgid" default="121" />
                <form action="/app/myaccount/?new_pgid=<cfoutput>#new_pgid#</cfoutput>" method="post" class="parsley-examples" id="account" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate>
                    <cfoutput>
                        <input type="hidden" name="ctaction" value="update" />
                        <div class="form-group col-md-12">
                            <label for="userFirstName">First Name<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" id="new_userFirstName" name="new_userFirstName" value="#userFirstName#" data-parsley-required data-parsley-error-message="First Name is required" placeholder="Enter your first name" />
                        </div>

                        <div class="form-group col-md-12">
                            <label for="userLastName">Last Name<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" id="new_userLastName" name="new_userLastName" value="#userLastName#" data-parsley-required data-parsley-error-message="Last Name is required" placeholder="Enter your last name" />
                        </div>

                        <div class="form-group col-md-12">
                            <label for="new_AvatarName">Avatar Name<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" id="new_AvatarName" name="new_AvatarName" value="#avatarname#" data-parsley-required data-parsley-error-message="Avatar Name is required" placeholder="Enter your Avatar name" />
                        </div>

                        <div class="form-group col-md-12">
                            <label for="useremail">Email<span class="text-danger">*</span></label>
                            <input class="form-control" name="new_useremail" value="#useremail#" data-parsley-type="email" id="email_address" placeholder="Enter your email" />
                        </div>

                        <div class="form-group col-md-12">
                            <label for="projName">Address </label>
                            <input class="form-control" type="text" id="add1" name="add1" value="#add1#" placeholder="Address" />
                            <div class="invalid-feedback">Please enter an address.</div>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="projName">Extended Address </label>
                            <input class="form-control" type="text" id="add2" name="add2" value="#add2#" placeholder="Extended address" />
                            <div class="invalid-feedback">Please enter an extended address.</div>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="valuetext">Town/City</label>
                            <input class="form-control" type="text" id="city" name="city" value="#city#" placeholder="Enter City" />
                        </div>

                        <div class="form-group col-md-6">
                            <label for="valuetext">Postal Code</label>
                            <input class="form-control" type="text" id="zip" name="zip" value="#zip#" placeholder="Enter Postal Code" />
                        </div>
                    </cfoutput>

                    <div class="form-group col-md-6">
                        <label for="countryid">Country <Cfoutput>[#new_countryid#]</Cfoutput><span class="text-danger">*</span></label>
                        <select id="countryid" class="form-control" name="new_countryid" data-parsley-required data-parsley-error-message="Country is required">
                            <option value="">--</option>
                            <cfoutput query="countries">
                                <option value="#countries.countryid#" <cfif #countries.countryid# is "#new_countryid#">selected</cfif>>#countries.countryname#</option>
                            </cfoutput>
                        </select>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="region_id">State/Region<span class="text-danger">*</span></label>
                        <select id="new_region_id" name="new_region_id" class="form-control">
                            <option value="">--</option>
                        </select>
                    </div>

                    <script>
                        $(document).ready(function(){
                            // Store the regions data in a variable
                            var regions = [
                                <cfoutput query="regions">
                                    {countryid: '#regions.countryid#', region_id: '#regions.region_id#', regionname: '#regions.regionname#'}<cfif regions.currentRow neq regions.recordCount>,</cfif>
                                </cfoutput>
                            ];

                            // Function to populate the states based on selected country
                            function populateRegions(countryid) {
                                var regionSelect = $('#new_region_id');
                                regionSelect.empty();
                                regionSelect.append('<option value="">--</option>');
                                $.each(regions, function(index, region) {
                                    if(region.countryid == countryid) {
                                        regionSelect.append('<option value="' + region.region_id + '">' + region.regionname + '</option>');
                                    }
                                });
                            }

                            // Event listener for country select change
                            $('#countryid').on('change', function() {
                                var selectedCountryId = $(this).val();
                                populateRegions(selectedCountryId);
                            });

                            // Initialize the regions based on the pre-selected country if any
                            var initialCountryId = $('#countryid').val();
                            if(initialCountryId) {
                                populateRegions(initialCountryId);
                            }
                        });
                    </script>

                    <cfif #ctaction# is "update">
                        <cfinclude template="/include/qry/update_159_3.cfm" />
                        <cfset ctaction = "view" />
                        <Cflocation url="/app/myaccount/?t3=1" />
                    </cfif>

                    <cfif #ctaction# is "addmember">
                        <cfinclude template="/include/qry/FINDK_159_4.cfm" />
                        <cfif #findK.recordcount# is "1">
                            <cfset new_contactid = findk.contactid />
                            <cfinclude template="/include/qry/insert_159_5.cfm" />
                        </cfif>
                        <cfset ctaction = "view" />
                        <cfset teamaction = "view" />
                    </cfif>

                    <cfif #ctaction# is "deleteitem">
                        <cfinclude template="/include/qry/FINDz_159_6.cfm" />
                        <cfif #findz.recordcount# is "1">
                            <cfset new_itemid = findz.itemid />
                            <cfinclude template="/include/qry/update_159_7.cfm" />
                        </cfif>
                        <cfset ctaction = "view" />
                        <cfset tab2_expand = "true" />
                        <cfset tab1_expand = "false" />
                        <cfset teamaction = "view" />
                    </cfif>

                    <cfif #ctaction# is "update_newsletter">
                        <cfinclude template="/include/qry/update_159_8.cfm" />
                        <cfset ctaction = "view" />
                    </cfif>

                    <cfif #ctaction# is "update_cal">
                        <Cfif #calendtime# is "00:00:00">
                            <cfset calendtime = "23:59:59" />
                        </cfif>
                        <cfinclude template="/include/qry/update_159_9.cfm" />
                        <cfset ctaction = "view" />
                        <Cflocation url="/app/myaccount/?t4=1" />
                    </cfif>

                    <script>
                        $(document).ready(function() {
                            $("#actinglinksupdate").on("show.bs.modal", function(event) {
                                
                                $(this).find(".modal-body").load("<cfoutput>/include/actinglinksupdate.cfm?userid=#userid#</cfoutput>");
                            });
                        });
                    </script>

                    <script>
                        $(document).ready(function() {
                            $("#dashboardupdate").on("show.bs.modal", function(event) {
                                
                                $(this).find(".modal-body").load("<cfoutput>/include/dashboardupdate.cfm?userid=#userid#</cfoutput>");
                            });
                        });
                    </script>

                    <cfset modalid = "remoteAddContact" />
                    <cfset modaltitle = "remoteAddContact" />
                    <cfinclude template="/include/modal.cfm" />

                    <cfset modalid = "actinglinksupdate" />
                    <cfset modaltitle = "Acting Links" />
                    <cfinclude template="/include/modal.cfm" />

                    <cfset modalid = "paneladd" />
                    <cfset modaltitle = "Custom Panel Add" />
                    <cfinclude template="/include/modal.cfm" />

                    <cfset modalid = "dashboardupdate" />
                    <cfset modaltitle = "Dashboard Preferences" />
                    <cfinclude template="/include/modal.cfm" />

                    <cfoutput>
                        <script>
                            $(document).ready(function() {
                                $("##paneladd").on("show.bs.modal", function(event) {
                                    
                                    $(this).find(".modal-body").load("/include/remotePanelAdd.cfm?userid=#userid#");
                                });
                            });
                        </script>
                    </cfoutput>

                    <cfloop query="sitetypes">
                        <cfoutput>
                            <script>
                                $(document).ready(function() {
                                    $("##addlink_#sitetypes.sitetypeid#").on("show.bs.modal", function(event) {
                                        
                                        $(this).find(".modal-body").load("/include/remotelinkAdd.cfm?new_sitetypeid=#sitetypes.sitetypeid#&userid=#userid#");
                                    });
                                });
                            </script>
                        </cfoutput>

                        <cfoutput>
                            <div id="addlink_#sitetypes.sitetypeid#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" >

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: ##f3f7f9;">
                                            <h4 class="modal-title" id="standard-modalLabel">Add Custom #sitetypes.sitetypename# Link</h4>
                                            <button type="button" class="close" data-bs-dismiss="modal" >
<i class="mdi mdi-close-thick"></i></button>
                                        </div>
                                        <div class="modal-body"></div>
                                    </div>
                                </div>
                            </div>
                        </cfoutput>
                    </cfloop>

                    <cfloop query="mylinks">
                        <cfoutput>
                            <script>
                                $(document).ready(function() {
                                    $("##updatelink_#mylinks.id#").on("show.bs.modal", function(event) {
                                        
                                        $(this).find(".modal-body").load("/include/remotelinkUpdate.cfm?id=#mylinks.id#");
                                    });
                                });
                            </script>
                        </cfoutput>

                        <cfoutput>
                            <div id="updatelink_#mylinks.id#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" >

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: ##f3f7f9;">
                                            <h4 class="modal-title" id="standard-modalLabel">#mylinks.sitetypename# Link Update</h4>
                                            <button type="button" class="close" data-bs-dismiss="modal" >
<i class="mdi mdi-close-thick"></i></button>
                                        </div>
                                        <div class="modal-body"></div>
                                    </div>
                                </div>
                            </div>
                        </cfoutput>
                    </cfloop>

                    <cfloop query="actions">
                        <cfoutput>
                            <script>
                                $(document).ready(function() {
                                    $("##updateaction_#actions.id#").on("show.bs.modal", function(event) {
                                        
                                        $(this).find(".modal-body").load("/include/remoteactionUpdate.cfm?id=#actions.id#");
                                    });
                                });
                            </script>
                        </cfoutput>

                        <cfoutput>
                            <div id="updateaction_#actions.id#" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" >

                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: ##f3f7f9;">
                                            <h4 class="modal-title" id="standard-modalLabel">#actions.systemName# Action Update</h4>
                                            <button type="button" class="close" data-bs-dismiss="modal" >
<i class="mdi mdi-close-thick"></i></button>
                                        </div>
                                        <div class="modal-body"></div>
                                    </div>
                                </div>
                            </div>
                        </cfoutput>
                    </cfloop>

                    <cfoutput>
                        <div id="addprofile" class="modal fade" tabindex="-1" aria-labelledby="standard-modalLabel" >

                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header" style="background-color: ##f3f7f9;">
                                        <h4 class="modal-title" id="standard-modalLabel">Profile Link</h4>
                                        <button type="button" class="close" data-bs-dismiss="modal" >
<i class="mdi mdi-close-thick"></i></button>
                                    </div>
                                    <div class="modal-body"></div>
                                </div>
                            </div>
                        </div>
                    </cfoutput>

                    <CFOUTPUT>
                        <CFSET CURRENTID = #userContactid# />
                    </CFOUTPUT>

                    <cfinclude template="/include/qry/itemsall.cfm" />
                    <cfinclude template="/include/qry/tagsvalid.cfm" />
                    <cfset catArea_UCB = "U" />
                    <cfinclude template="/include/qry/categories.cfm" />

                    <cfif #ctaction# is "deleteitem">
                        <cfinclude template="/include/qry/del_159_10.cfm" />
                        <cfset ctaction = "update" />
                    </cfif>

                    <cfif #ctaction# is "update">
                        <cfinclude template="/include/qry/del_159_11.cfm" />
                        <CFLOOP QUERY="categories">
                            <cfinclude template="/include/qry/Find_159_12.cfm" />
                            <cfif #Find.recordcount# is "0">
                                <cfinclude template="/include/qry/Insert_159_13.cfm" />
                            </cfif>
                        </CFLOOP>
                        <cfset ctaction = "view" />
                    </cfif>

                    <cfinclude template="/include/qry/usercontact_159_14.cfm" />
                    <cfset currentid = usercontact.contactid />

                    <div class="row" style="margin: auto;">
                        <div class="col-md-12"></div>
                    </div>

                    <div id="updatecal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" >

                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: ##f3f7f9;">
                                    <h4 class="modal-title" id="standard-modalLabel">Default Settings Update</h4>
                                    <button type="button" class="close" data-bs-dismiss="modal" >
<i class="mdi mdi-close-thick"></i></button>
                                </div>
                                <div class="modal-body">
                                    <p>Update your default settings.</p>
                                    <form action="/app/myaccount/" method="post" class="parsley-examples" data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" data-parsley-trigger="keyup" data-parsley-validate id="preferences">
                                        <div class="row" />
                                        <cfoutput>
                                            <input type="hidden" name="ctaction" value="update_cal" />
                                            <input type="hidden" name="t4" value="1" />
                                            <div class="form-group col-md-6">
                                                <label for="eventTypeName">Start Time<span class="text-danger">*</span></label>
                                                <input class="form-control" id="calstarttime" value="#calstarttime#" type="time" name="calstarttime" data-parsley-required data-parsley-error-message="Start Time is required" />
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="eventTypeName">End Time<span class="text-danger">*</span></label>
                                                <input class="form-control" id="calendtime" value="#calendtime#" type="time" name="calendtime" data-parsley-required data-parsley-error-message="End Time is required" />
                                            </div>

                                            <div class="form-group col-md-6">
                                                <label for="defrows">Rows Per Page<span class="text-danger">*</span></label>
                                                <select class="form-control" name
