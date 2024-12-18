<!--- This ColdFusion page displays a contact card view based on active categories and their associated items. --->
<cfset dbug = "Y" />

<div id="contact-card-view2" class="container mt-4">
    <div class="row">
        <!--- Loop through active categories to display their items --->
        <cfloop query="ActiveCategories">
            <cfif catid NEQ 0>
                <cfinclude template="/include/qry/itemsbycatActive.cfm" />

                <!-- Each category becomes a single column -->
                <div class="col-md-4 mb-4">
                    <div class="contact-info-section mb-4 position-relative ps-5">
                        <cfoutput>
                            <cfif result.itemsbycatActive.recordcount NEQ 0>
                                <i class="#ActiveCategories.caticon# font-26" style="position: absolute; left: 0; top: 0;"></i>
                            <cfelse>
                                <i class="#ActiveCategories.caticon# text-muted font-weight-lighter font-26" style="position: absolute; left: 0; top: 0;"></i>
                            </cfif>
                        </cfoutput>

                        <cfif result.itemsbycatActive.recordcount NEQ 0>
                            <cfloop query="result.itemsbycatActive">
                                <cfif ActiveCategories.catfieldset EQ "address">
                                    <cfoutput>
                                        <h5 style="#h5style#">
                                            #valuestreetaddress#
                                            <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#">
                                                <i class="mdi mdi-square-edit-outline"></i>
                                            </a>
                                            <cfif valueExtendedaddress NEQ "">
                                                <br />#valueExtendedaddress#
                                                <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#">
                                                    <i class="mdi mdi-square-edit-outline"></i>
                                                </a>
                                            </cfif>

                                            <cfif valuecity NEQ "">
                                                <br />#valuecity#
                                                <cfif valueExtendedaddress EQ "">
                                                    <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#">
                                                        <i class="mdi mdi-square-edit-outline"></i>
                                                    </a>
                                                </cfif>
                                            </cfif>

                                            <cfif valuecity NEQ "" AND valueRegion NEQ "">
                                                ,#valueRegion#
                                                <cfif valueExtendedaddress EQ "">
                                                    <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#">
                                                        <i class="mdi mdi-square-edit-outline"></i>
                                                    </a>
                                                </cfif>
                                            </cfif>

                                            <cfif valuepostalcode NEQ "">
                                                &nbsp; #valuepostalcode#
                                            </cfif>
                                        </h5>
                                        <div class="text-uppercase mb-1 text-start" style="font-size:13px;">
                                            #valuetype#
                                        </div>
                                    </cfoutput>
                                </cfif>

                                <cfif ActiveCategories.catfieldset EQ "company">
                                    <cfoutput>
                                        <h5 style="#h5style#">
                                            #valueCompany#
                                            <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#">
                                                <i class="mdi mdi-square-edit-outline"></i>
                                            </a>
                                            <cfif valueTitle NEQ "">
                                                <br />#valueTitle#
                                            </cfif>
                                            <cfif valueDepartment NEQ "">
                                                <br />#valueDepartment#
                                            </cfif>
                                        </h5>
                                        <div class="text-uppercase mb-1 text-start" style="font-size:13px;">
                                            #valuetype#
                                        </div>
                                    </cfoutput>
                                </cfif>

                                <cfif ActiveCategories.catfieldset EQ "date">
                                    <cfoutput>
                                        <h5 style="#h5style#">#dateformat(itemdate,'mm-dd-YYYY')#
                                            <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#">
                                                <i class="mdi mdi-square-edit-outline"></i>
                                            </a>
                                        </h5>
                                        <div class="text-uppercase mb-1 text-start" style="font-size:13px;">
                                            #valuetype#
                                        </div>
                                    </cfoutput>
                                </cfif>

                                <cfif ActiveCategories.catfieldset EQ "long">
                                    <cfoutput>
                                        <h5 style="#h5style#">
                                            #itemnotes#
                                        </h5>
                                        <div class="text-uppercase mb-1 text-start" style="font-size:13px;">
                                            #valuetype#
                                        </div>
                                    </cfoutput>
                                </cfif>

                                <cfif ActiveCategories.catfieldset EQ "text">
                                    <cfif ActiveCategories.valueCategory EQ "Phone">
                                        <cfset phonenumber = valuetext />
                                        <cfinclude template="formatPhoneNumber.cfm">
                                        <cfoutput>
                                            <h5 style="#h5style#">#formatPhoneNumber#
                                                <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemid#" data-bs-placement="top" title="Update Phone">
                                                    <i class="mdi mdi-square-edit-outline"></i>
                                                </a>
                                            </h5>
                                            <div class="text-uppercase mb-1 text-start" style="font-size:13px;">
                                                #valuetype#
                                            </div>
                                        </cfoutput>
                                    </cfif>

                                    <cfif ActiveCategories.valueCategory EQ "Email">
                                        <cfoutput>
                                            <h5 style="#h5style#">
                                                <a href="mailto:#valuetext#" target="_blank">#valuetext#</a>
                                                <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#">
                                                    <i class="mdi mdi-square-edit-outline"></i>
                                                </a>
                                            </h5>
                                            <div class="text-uppercase mb-1 text-start" style="font-size:13px;">
                                                #valuetype#
                                            </div>
                                        </cfoutput>
                                    </cfif>

                                    <cfif ActiveCategories.valueCategory NOT IN ("Email", "Phone", "Tag")
                                        AND ActiveCategories.catfieldset EQ "text">
                                        <cfoutput>
                                            <h5 style="#h5style#">
                                                <cfif left(valuetext,4) EQ "http">
                                                    <a href="#valuetext#" target="_blank">#valuetext#</a>
                                                <cfelse>
                                                    #valuetext#
                                                </cfif>
                                                <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#">
                                                    <i class="mdi mdi-square-edit-outline"></i>
                                                </a>
                                            </h5>
                                            <div class="text-uppercase mb-1 text-start" style="font-size:13px;">
                                                #valuetype#
                                            </div>
                                        </cfoutput>
                                    </cfif>
                                </cfif>
                            </cfloop>
                        <cfelse>
                            <!-- If no records -->
                            <h5 class="text-muted font-weight-lighter">
                                Add <cfoutput> #ActiveCategories.valueCategory#</cfoutput>
                            </h5>
                        </cfif>

                        <cfoutput>
                            <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteAddC#ActiveCategories.catid#" data-bs-placement="top" title="Add #ActiveCategories.valueCategory#">
                                <i class="fe-plus-circle"></i>
                            </a>
                        </cfoutput>
                    </div>
                </div>
            </cfif>
        </cfloop>
    </div>
</div>


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
