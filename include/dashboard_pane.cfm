<cfinclude template="/include/qry/dashboardoptions.cfm" />
                <h5>
                    Dashboard Preferences

                </h5>

                <div class="row" style="margin: auto;">

                    <div class="col-md-2 p-2"><a title="Edit" href="dashboardupdate.cfm" data-remote="true" data-toggle="modal" data-target="#dashboardupdate"><strong>Dashboard panels</strong></a></div>
                    <div class="col-md-10 p-2">
                        
                         <cfloop query="dashboards">  <cfoutput><span class="badge badge-secondary">
                        #dashboards.pntitle#</span> </Cfoutput></cfloop>
                            <a title="Edit" href="dashboardupdate.cfm" data-remote="true" data-toggle="modal" data-target="#dashboardupdate"><i class="mdi mdi-square-edit-outline"></i></a>
                     </div>

                </div>