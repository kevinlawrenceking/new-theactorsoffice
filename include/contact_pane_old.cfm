<!--- This ColdFusion page displays a contact card view based on active categories and their associated items. --->

<cfset dbug = "Y" />

<div id="contact-card-view2" style="flex: 1 1 auto; display: flex; flex-flow: row wrap; margin: 30px auto 0px; padding: 0px 10px; ">

    <!--- Loop through active categories to display their items --->
    <cfloop query="ActiveCategories">

        <!--- Check if catid is not 0 --->
        <cfif #catid# is not "0">

            <cfinclude template="/include/qry/itemsbycatActive.cfm" />

            <div class="flexit">

                <div class="contact-info-section" style="margin-bottom: 35px; position: relative; padding-left: 50px;">

                    <cfoutput>

                        <!--- Check if items by category active record count is not 0 --->
                        <cfif #result.itemsbycatActive.recordcount# is not "0">

                            <i class="#ActiveCategories.caticon# font-26" style="position: absolute; left: 0; top: 0;"></i>

                        </cfif>
                        <!--- end if itemsbycatActive.recordcount is not 0 --->

                        <!--- Check if items by category active record count is 0 --->
                        <cfif #result.itemsbycatActive.recordcount# is "0">

                            <i class="#ActiveCategories.caticon# text-muted font-weight-lighter font-26" style="position: absolute; left: 0; top: 0;"></i>

                        </cfif>
                        <!--- end if itemsbycatActive.recordcount is 0 --->

                    </cfoutput>

                    <!--- Check if items by category active record count is not 0 --->
                    <cfif #result.itemsbycatActive.recordcount# is not "0">

                        <!--- Loop through items by category active --->
                        <cfloop query="result.itemsbycatActive">

                            <!--- Check if category fieldset is address --->
                            <cfif #ActiveCategories.catfieldset# is "address">

                                <cfoutput>

                                    <h5 style="#h5style#">

                                        #result.itemsbycatActive.valuestreetaddress#

                                        <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#result.itemsbycatActive.itemid#" toggle="tooltip" data-bs-placement="top" title="Update" #ActiveCategories.valueCategory# data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                            <i class="mdi mdi-square-edit-outline"></i>

                                        </a>

                                        <!--- Check if extended address is not blank --->
                                        <cfif #result.itemsbycatActive.valueExtendedaddress# is not "">

                                            <br />#result.itemsbycatActive.valueExtendedaddress#

                                            <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#result.itemsbycatActive.itemid#" toggle="tooltip" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                <i class="mdi mdi-square-edit-outline"></i>

                                            </a>

                                        </cfif>
                                        <!--- end if itemsbycatActive.valueExtendedaddress is not blank --->

                                        <!--- Check if city is not blank --->
                                        <cfif #result.itemsbycatActive.valuecity# is not "">

                                            <br />#result.itemsbycatActive.valuecity#

                                            <!--- Check if extended address is blank --->
                                            <cfif #result.itemsbycatActive.valueExtendedaddress# is "">

                                                <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#result.itemsbycatActive.itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                    <i class="mdi mdi-square-edit-outline"></i>

                                                </a>

                                            </cfif>
                                            <!--- end if itemsbycatActive.valueExtendedaddress is blank --->

                                        </cfif>
                                        <!--- end if itemsbycatActive.valuecity is not blank --->

                                        <!--- Check if city and region are not blank --->
                                        <cfif #result.itemsbycatActive.valuecity# is not "" and #result.itemsbycatActive.valueRegion# is not "">

                                            ,#result.itemsbycatActive.valueRegion#

                                            <!--- Check if extended address is blank --->
                                            <cfif #result.itemsbycatActive.valueExtendedaddress# is "">

                                                <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#result.itemsbycatActive.itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                    <i class="mdi mdi-square-edit-outline"></i>

                                                </a>

                                            </cfif>
                                            <!--- end if itemsbycatActive.valueExtendedaddress is blank --->

                                        </cfif>
                                        <!--- end if itemsbycatActive.valuecity is not blank and itemsbycatActive.valueRegion is not blank --->

                                        <!--- Check if postal code is not blank --->
                                        <cfif #result.itemsbycatActive.valuepostalcode# is not "">

                                            &nbsp; #result.itemsbycatActive.valuepostalcode#

                                        </cfif>
                                        <!--- end if itemsbycatActive.valuepostalcode is NOT blank --->

                                    </h5>

                                    <div style="font-13 text-uppercase mb-1; text-align:left;">

                                        #result.itemsbycatActive.valuetype#

                                    </div>

                                </cfoutput>

                            </cfif>
                            <!--- end if ActiveCategories.catfieldset is address --->

                            <!--- Check if category fieldset is company --->
                            <cfif #ActiveCategories.catfieldset# is "company">

                                <cfoutput>

                                    <h5 style="#h5style#">

                                        #result.itemsbycatActive.valueCompany#

                                        <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#result.itemsbycatActive.itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                            <i class="mdi mdi-square-edit-outline"></i>

                                        </a>

                                        <!--- Check if title is not blank --->
                                        <cfif #result.itemsbycatActive.valueTitle# is not "">

                                            <br />#result.itemsbycatActive.valueTitle#

                                        </cfif>
                                        <!--- end if itemsbycatActive.valueTitle is not blank --->

                                        <!--- Check if department is not blank --->
                                        <cfif #result.itemsbycatActive.valueDepartment# is not "">

                                            <br />#result.itemsbycatActive.valueDepartment#

                                        </cfif>
                                        <!--- end if itemsbycatActive.valueDepartment is not blank --->

                                    </h5>

                                    <div style="font-13 text-uppercase mb-1; text-align:left;">

                                        #result.itemsbycatActive.valuetype#

                                    </div>

                                </cfoutput>

                            </cfif>
                            <!--- end if ActiveCategories.catfieldset is company --->

                            <!--- Check if category fieldset is date --->
                            <cfif #ActiveCategories.catfieldset# is "date">

                                <cfoutput>

                                    <h5 style="#h5style#">#dateformat('#result.itemsbycatActive.itemdate#','mm-dd-YYYY')#

                                        <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#result.itemsbycatActive.itemid#" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                            <i class="mdi mdi-square-edit-outline"></i>

                                        </a>

                                    </h5>

                                    <div style="font-13 text-uppercase mb-1; text-align:left;">

                                        #result.itemsbycatActive.valuetype#

                                    </div>

                                </cfoutput>

                            </cfif>
                            <!--- end if ActiveCategories.catfieldset is date --->

                            <!--- Check if category fieldset is long --->
                            <cfif #ActiveCategories.catfieldset# is "long">

                                <cfoutput>

                                    <h5 style="#h5style#">

                                        #result.itemsbycatActive.itemnotes#

                                    </h5>

                                    <div style="font-13 text-uppercase mb-1; text-align:left;">

                                        #result.itemsbycatActive.valuetype#

                                    </div>

                                </cfoutput>

                            </cfif>
                            <!--- end if ActiveCategories.catfieldset is long --->

                            <!--- Check if category fieldset is text --->
                            <cfif #ActiveCategories.catfieldset# is "text">

                                <!--- Check if category is Phone --->
                                <cfif #ActiveCategories.valueCategory# is "Phone">

                                    <cfset phonenumber=result.itemsbycatActive.valuetext />

                                    <cfinclude template="formatPhoneNumber.cfm" />

                                    <cfoutput>

                                        <h5 style="#h5style#">#formatPhoneNumber#

                                            <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#result.itemsbycatActive.itemid#" data-bs-placement="top" title="Update Phone" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                <i class="mdi mdi-square-edit-outline"></i>

                                            </a>

                                        </h5>

                                        <div style="font-13 text-uppercase mb-1; text-align:left;">

                                            #result.itemsbycatActive.valuetype#

                                        </div>

                                    </cfoutput>

                                </cfif>
                                <!--- end if ActiveCategories.valueCategory is Phone --->

                                <!--- Check if category is Email --->
                                <cfif #ActiveCategories.valueCategory# is "Email">

                                    <cfoutput>

                                        <h5 style="#h5style#">

                                            <a HREF="mailto:#result.itemsbycatActive.valuetext#" target="_blank">#result.itemsbycatActive.valuetext#</a>

                                            <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#result.itemsbycatActive.itemid#" toggle="tooltip" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                <i class="mdi mdi-square-edit-outline"></i>

                                            </a>

                                        </h5>

                                        <div style="font-13 text-uppercase mb-1; text-align:left;">

                                            #result.itemsbycatActive.valuetype#

                                        </div>

                                    </cfoutput>

                                </cfif>
                                <!--- end if ActiveCategories.valueCategory is Email --->

                                <!--- Check if category is not Email, Phone, or Tag --->
                                <cfif #ActiveCategories.valueCategory# is not "Email" and #ActiveCategories.valueCategory# is not "Phone" and #ActiveCategories.valueCategory# is not "Tag">

                                    <cfoutput>

                                        <h5 style="#h5style#">

                                            <cfif #left(result.itemsbycatActive.valuetext,4)# is "http">

                                                <a href="#result.itemsbycatActive.valuetext#" target="_blank">

                                                    #result.itemsbycatActive.valuetext#

                                                </a>

                                            </cfif>
                                            <!--- end if left(itemsbycatActive.valuetext,4) is http --->

                                            <cfif #left(result.itemsbycatActive.valuetext,4)# is not "http">

                                                #result.itemsbycatActive.valuetext#

                                            </cfif>
                                            <!--- end if left(itemsbycatActive.valuetext,4) is NOT http --->

                                            <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteUpdateC#result.itemsbycatActive.itemid#" toggle="tooltip" data-bs-placement="top" title="Update #ActiveCategories.valueCategory#" data-bs-original-title="Update #ActiveCategories.valueCategory#">

                                                <i class="mdi mdi-square-edit-outline"></i>

                                            </a>

                                        </h5>

                                        <div style="font-13 text-uppercase mb-1; text-align:left;">

                                            #result.itemsbycatActive.valuetype#

                                        </div>

                                    </cfoutput>

                                </cfif>
                                <!--- end if ActiveCategories.valueCategory is not Email and ActiveCategories.valueCategory is not Phone and ActiveCategories.valueCategory is not Tag --->



                            </cfif>
                          <!--- end if ActiveCategories.catfieldset is text --->

                        </cfloop>

                    </cfif>
                    <!--- end itemsbycatActive.recordcount is not 0 --->

                    <!--- Check if items by category active record count is 0 --->
                    <cfif #result.itemsbycatActive.recordcount# is "0">

                        <h5 class="text-muted font-weight-lighter">Add <cfoutput> #ActiveCategories.valueCategory#</cfoutput>

                        </h5>

                    </cfif>
                    <!--- end itemsbycatActive.recordcount is 0 --->

                    <cfoutput>

                        <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteAddC#ActiveCategories.catid#" data-bs-placement="top" title="Add #ActiveCategories.valueCategory#" data-bs-original-title="Add #ActiveCategories.valueCategory#">

                            <i class="fe-plus-circle"></i>
                        </a>

                    </cfoutput>

                </div>

            </div>

        </cfif>
        <!--- end if catid is not 0 --->

    </cfloop>

</div>

<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
