<cfparam name="mock_yn" default="N" />

<cfparam name="BROWSER_USER_AVATAR_FILENAME" default="N" />
<cfif #mock_yn# is "Y" and #mocktoday# is not "">

    <cfset cookie.mocktoday=mocktoday />
    <cfelse>

        <cfcookie name="mocktoday" expires="#now()#">

</cfif>

<div class="left-side-menu">

    <div class="h-100" data-simplebar>
  
        
        <!--- Sidemenu --->
        <div id="sidebar-menu">

            <ul id="side-menu">
        <li><div class="user-lg text-center">
            
            <A HREF="/app/image-upload/?ref_pgid=7" style="text-align:center;">

                <cfoutput> <img src="/media-#host#/users/#session.userid#/avatar.jpg?ver=#rand()#" alt="user-image" id="mobile" class="rounded-circle avatar-md text-center" ></cfoutput><BR />
               <span class="pro-user-name ml-1 text-center"  >
                    <cfoutput>#useravatarname#</cfoutput>
                </span>

            </A>
</div>
          

        </li>
                
                <Cfoutput query="mennuItemsU">
                    <li>
                        <a href="/app/#mennuItemsU.compDir#/">
                            <i data-feather="#mennuitemsU.compicon#"></i>
                            <span> #mennuItemsU.compName# </span>
                        </a>
                    </li>

                </Cfoutput>

                <cfif #userrole# is "Administrator">

 
                <li>
                                <a href="#sidebara" data-bs-toggle="collapse">
                                <i data-feather="sliders"></i>
                                    <span> Relationships - Admin </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <div class="collapse" id="sidebara">
                                    <ul class="nav-second-level">
                                        
                                          <Cfoutput query="mennuItemsa">    
                                             <li>
                            <a href="/app/#mennuItemsA.compDir#/">
             
                                <span> #mennuItemsA.compName# </span>
                            </a>
                        </li>
                                        </Cfoutput>
                                        
                                        
                                    </ul>
                                </div>
                            </li>
          
                
                
                <li>
                                <a href="#sidebarEmail" data-bs-toggle="collapse">
                                      <i data-feather="sliders"></i>
                                    <span> Auditionz - Admin </span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <div class="collapse" id="sidebarEmail">
                                    <ul class="nav-second-level">
                                        
                                          <Cfoutput query="mennuItemsaud">    
                                             <li>
                            <a href="/app/#mennuItemsAud.compDir#/">
                      
                                <span> #mennuItemsAud.compName# </span>
                            </a>
                        </li>
                                        </Cfoutput>
                                        
                                        
                                    </ul>
                                </div>
                            </li>
                
                
                
                
                </cfif>
                
                
                
                
                
                

                <cfif #userIsBetaTester# is "1">
                    <li>
                        <a href="/app/Testings/">
                            <i data-feather="list"></i>
                            <span> Testing Log</span>
                        </a>
                    </li>

                </cfif>


            </ul>

        </div>
        <!-- End Sidebar -->

        <div class="clearfix"></div>

    </div>
    <!-- Sidebar -left -->

</div>