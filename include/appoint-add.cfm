<!--- This ColdFusion page handles the creation of an appointment with various input fields and validation. --->

<cfparam name="rcontactid" default="0"/>



<cfinclude template="/include/qry/relationships_13_1.cfm"/>
<cfinclude template="/include/qry/durations.cfm"/>
<cfinclude template="/include/qry/eventtypes_user_443_2.cfm"/>
<div class="row">
<div class="col-xl-6 col-lg-8 col-md-12">
    <div class="card">
        <div class="card-body">
            <form 
                method="post" 
                action="/include/appoint-add2.cfm" 
                class="parsley-examples" 
                name="event-form" 
                id="form-event" 
                data-parsley-excluded="input[type=button], input[type=submit], input[type=reset], input[type=hidden], [disabled], :hidden" 
                data-parsley-trigger="keyup" 
                data-parsley-validate>
                
                <cfoutput>
                    <input type="hidden" name="returnurl" value="#returnurl#">
                    <input type="hidden" name="rcontactid" value="#rcontactid#">
                    <input type="hidden" name="userid" value="#userid#">
                </cfoutput>

                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label class="control-label">Title<span class="text-danger">*</span></label>
                            <input 
                                class="form-control" 
                                autocomplete="off" 
                                placeholder="Insert Appointment Title" 
                                type="text" 
                                name="eventTitle" 
                                id="eventTitle" 
                                data-parsley-minlength="3" 
                                data-parsley-minlength-message="Min length 3 characters" 
                                data-parsley-maxlength="200" 
                                data-parsley-maxlength-message="Max length 200 characters" 
                                data-parsley-required 
                                data-parsley-error-message="Title is required" />
                        </div>
                    </div>
                    
                    <div class="col-12">
                        <div class="form-group">
                            <label for="select-relationship">Relationships<span class="text-danger">*</span></label>
                            <select 
                                id="select-relationship" 
                                name="relationships" 
                                autocomplete="off" 
                                multiple 
                                required 
                                data-parsley-required 
                                data-parsley-error-message="Relationship is required" 
                                class="demo-default selectize-close-btn" 
                                style="width: 100%" 
                                placeholder="Select a Relationship..." 
                                value="">
                                <option value="">Select a Relationship...</option>
                                <cfloop query="relationships">
                                    <cfoutput>
                                        <option 
                                            value="#relationships.contactid#" 
                                            <cfif "#relationships.contactid#" is "#rcontactid#">selected</cfif>>
                                            #recordname#
                                        </option>
                                    </cfoutput>
                                </cfloop>
                            </select>
                        </div>
                    </div>

                    
                        <div class="form-group col-md-12">
                            <label for="eventDescription">Description</label>
                            <textarea 
                                class="form-control" 
                                type="text" 
                                id="eventDescription" 
                                name="eventDescription" 
                                placeholder="Description" 
                                rows="4"></textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventLocation">Location</label>
                            <input 
                                class="form-control" 
                                type="text" 
                                id="eventLocation" 
                                autocomplete="off" 
                                name="eventLocation" 
                                placeholder="Location">
                        </div>

                        
                        <div class="form-group col-md-12">
                            <label for="eventDescription">Description</label>
                            <textarea 
                                class="form-control" 
                                type="text" 
                                id="eventDescription" 
                                name="eventDescription" 
                                placeholder="Description" 
                                rows="4"></textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventLocation">Location</label>
                            <input 
                                class="form-control" 
                                type="text" 
                                id="eventLocation" 
                                autocomplete="off" 
                                name="eventLocation" 
                                placeholder="Location">
                        </div>

                        
                        <div class="form-group col-md-12">
                            <label for="eventDescription">Description</label>
                            <textarea 
                                class="form-control" 
                                type="text" 
                                id="eventDescription" 
                                name="eventDescription" 
                                placeholder="Description" 
                                rows="4"></textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventLocation">Location</label>
                            <input 
                                class="form-control" 
                                type="text" 
                                id="eventLocation" 
                                autocomplete="off" 
                                name="eventLocation" 
                                placeholder="Location">
                        </div>

                        
                        <div class="form-group col-md-12">
                            <label for="eventDescription">Description</label>
                            <textarea 
                                class="form-control" 
                                type="text" 
                                id="eventDescription" 
                                name="eventDescription" 
                                placeholder="Description" 
                                rows="4"></textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventLocation">Location</label>
                            <input 
                                class="form-control" 
                                type="text" 
                                id="eventLocation" 
                                autocomplete="off" 
                                name="eventLocation" 
                                placeholder="Location">
                        </div>

                        
                        <div class="form-group col-md-12">
                            <label for="eventDescription">Description</label>
                            <textarea 
                                class="form-control" 
                                type="text" 
                                id="eventDescription" 
                                name="eventDescription" 
                                placeholder="Description" 
                                rows="4"></textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventLocation">Location</label>
                            <input 
                                class="form-control" 
                                type="text" 
                                id="eventLocation" 
                                autocomplete="off" 
                                name="eventLocation" 
                                placeholder="Location">
                        </div>

                        
                        <div class="form-group col-md-12">
                            <label for="eventDescription">Description</label>
                            <textarea 
                                class="form-control" 
                                type="text" 
                                id="eventDescription" 
                                name="eventDescription" 
                                placeholder="Description" 
                                rows="4"></textarea>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="eventLocation">Location</label>
                            <input 
                                class="form-control" 
                                type="text" 
                                id="eventLocation" 
                                autocomplete="off" 
                                name="eventLocation" 
                                placeholder="Location">
                        </div>

                    <div class="col-12">
                        <div class="form-group">
                            <div id="checkboxes"></div>
                        </div>
                    </div>

                    <div class="col-md-6" id="hidden_div">
                        <div class="form-group">
                            <label for="endRecur">Recurring Until:</label>
                            <input class="form-control" id="endRecur" name="endRecur" type="date">
                        </div>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-6"></div>
                    <div class="col-6 text-right">
                        <a href="javascript:history.go(-1)">
                            <button type="button" class="btn btn-light mr-1 btn-sm" data-bs-dismiss="modal">Back</button>
                        </a>
                        <button type="submit" class="btn btn-primary btn-sm waves-effect waves-light" id="btn-save-event">Add</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</div>


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), '\')#"/>
<cfinclude template="/include/bigbrotherinclude.cfm"/>
