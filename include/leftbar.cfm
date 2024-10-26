<cfparam name="mock_yn" default="N" />
<cfparam name="BROWSER_USER_AVATAR_FILENAME" default="N" />

<cfif mock_yn eq "Y" and len(mocktoday)>
    <cfset cookie.mocktoday = mocktoday />
<cfelse>
    <cfcookie name="mocktoday" expires="#now()#">
</cfif>

<div class="left-side-menu">
    <div class="h-100" data-simplebar>
        <!--- Sidemenu --->
        <div id="sidebar-menu">
            <ul id="side-menu">
                <li>
                    <div class="user-lg text-center">
                        <a href="/app/image-upload/?ref_pgid=7" style="text-align:center;">
                            <cfoutput>
                                <img src="#session.userAvatarUrl#" alt="user-image" id="mobile" class="rounded-circle avatar-md text-center">
                                <br />
                                <span class="pro-user-name ml-1 text-center">#avatarname#</span>
                            </cfoutput>
                        </a>
                    </div>
                </li>

                <cfoutput query="mennuItemsU">
                    <li>
                        <a href="/app/#mennuItemsU.compDir#/">
                            <i data-feather="#mennuItemsU.compicon#"></i>
                            <span>#mennuItemsU.compName#</span>
                        </a>
                    </li>
                </cfoutput>

                <cfif userrole eq "Administrator">
                    <li>
                        <a href="#sidebara" data-bs-toggle="collapse">
                            <i data-feather="sliders"></i>
                            <span>Relationships - Admin</span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebara">
                            <ul class="nav-second-level">
                                <cfoutput query="mennuItemsa">
                                    <li>
                                        <a href="/app/#mennuItemsa.compDir#/">
                                            <span>#mennuItemsa.compName#</span>
                                        </a>
                                    </li>
                                </cfoutput>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="#sidebarEmail" data-bs-toggle="collapse">
                            <i data-feather="sliders"></i>
                            <span>Audition - Admin</span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="sidebarEmail">
                            <ul class="nav-second-level">
                                <cfoutput query="mennuItemsaud">
                                    <li>
                                        <a href="/app/#mennuItemsaud.compDir#/">
                                            <span>#mennuItemsaud.compName#</span>
                                        </a>
                                    </li>
                                </cfoutput>
                            </ul>
                        </div>
                    </li>
                </cfif>

                <cfif isbetatester eq "1">
                    <li>
                        <a href="/app/Testings/">
                            <i data-feather="list"></i>
                            <span>Testing Log</span>
                        </a>
                    </li>
                </cfif>
            </ul>
        </div>
        <!--- End Sidebar --->
        <div class="clearfix"></div>
    </div>
    <!--- Sidebar -left --->
</div>

