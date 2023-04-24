<cfparam name="mock_yn" default="N" />

<cfif #mock_yn# is "Y" and #mocktoday# is not "">

<cfset cookie.mocktoday = mocktoday />
    <cfelse>
        
            <cfcookie name="mocktoday" expires="#now()#">

</cfif>

<cfinclude template="/include/qry/menuitems.cfm">

<ul id="side-menu">
    
    <cfif isdefined('cookie.mocktoday') >
        <cfif #isdefined('fdf')#><Cfset currentStartDate = "#DateFormat(COOKIE.mocktoday,'MM/DD/YYYY')#" /></cfif>
        <Cfset currentStartDate = "#DateFormat(Now(),'MM/DD/YYYY')#" />
<cfelse>
    
    <Cfset currentStartDate = "#DateFormat(Now(),'MM/DD/YYYY')#" />
    
    </cfif>
        <cfif #isdefined('fdf')#> <li class="menu-title" style="color: antiquewhite"><cfoutput><centeR>#currentstartdate#</centeR> </cfoutput></li></cfif>
    
    
        <cfif #isdefined('fdf')#> <li class="menu-title" style="color: #DECE8E;">User Menu</li></cfif>
                
<Cfoutput query="mennuItemsU">
                          <li>
                                <a href="/app/#mennuItemsU.compDir#/">
                                    <i data-feather="#mennuitemsU.compicon#"></i>
                                    <span> #mennuItemsU.compName# </span>
                                </a>
                            </li>
    
    
    </Cfoutput>
        
        
<cfif #userrole# is "Administrator">
    <cfif #isdefined('fdf')#>   <li class="menu-title" style="color: #DECE8E;">Admin Menu</li></cfif>

                      
<Cfoutput query="mennuItemsa">
                          <li>
                                <a href="/app/#mennuItemsA.compDir#/">
                                    <i data-feather="#mennuitemsA.compicon#"></i>
                                    <span> #mennuItemsA.compName# </span>
                                </a>
                            </li>
    
    
    </Cfoutput>
    </cfif>
                                    </ul>
                                </div>
                            </li>


                        </ul>