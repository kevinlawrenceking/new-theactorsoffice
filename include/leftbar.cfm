<cfparam name="mockYN" default="N" />
<cfparam name="browserUserAvatarFileName" default="N" />

<cfif mockYN eq "Y" and len(mockToday)>
    <cfset cookie.mockToday = mockToday />
<cfelse>
    <cfcookie name="mockToday" expires="#now()#">
</cfif>

<div class="left-side-menu">
    <div class="h-100" data-simplebar>
        <!--- Sidemenu --->
        <div id="sidebar-menu">
            <ul id="side-menu">
                <li>
                    <div class="user-lg text-center">
                        <a href="/app/image-upload/?ref_pgid=7" style="text-align:center;">
                            <img src="#session.userAvatarUrl#" alt="user-image" id="mobile" class="rounded-circle avatar-md text-center">
                            <br />
                            <span class="pro-user-name ml-1 text-center">#avatarName#</span>
                        </a>
                    </div>
                </li>

                <cfoutput query="menuItemsU">
                    <li>
                        <a href="/app/#menuItemsU.compDir#/">
                            <i data-feather="#menuItemsU.compIcon#"></i>
                            <span>#menuItemsU.compName#</span>
                        </a>
                    </li>
                </cfoutput>

                <cfif userRole eq "Administrator">
                    <li>
                        <a href="#sidebarA" data-bs-toggle="collapse">
                            <i data-feather="sliders"></i>
                            <span>Relationships - Admin</span>
                            <span class="menu-arrow"></span>
                        </a>

                        <div class="collapse" id="sidebarA">
                            <ul class="nav-second-level">
                                <cfoutput query="menuItemsA">
                                    <li>
                                        <a href="/app/#menuItemsA.compDir#/">
                                            <span>#menuItemsA.compName#</span>
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
                                <cfoutput query="menuItemsAud">
                                    <li>
                                        <a href="/app/#menuItemsAud.compDir#/">
                                            <span>#menuItemsAud.compName#</span>
                                        </a>
                                    </li>
                                </cfoutput>
                            </ul>
                        </div>
                    </li>
                </cfif>

                <cfif isBetaTester eq "1">
                    <li>
                        <a href="/app/Testings/">
                            <i data-feather="list"></i>
                            <span>Testing Log</span>
                        </a>
                    </li>
                </cfif>

            </ul>
        </div> <!--- End Sidebar --->
        <div class="clearfix"></div> 
    </div> <!--- Sidebar -left --->
</div>

<!--- Changes: Standardized variable names and casing (Rule 5), Removed unnecessary cfoutput tags (Rule 2), Ensured consistent attribute quoting, spacing, and formatting (Rule 6) --->