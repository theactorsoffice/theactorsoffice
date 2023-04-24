<cfparam name="focusID" default="" />
<cfparam name="cur_link" default="" />
<cfparam name="start" default="start" />
<cfparam name="perpage" default="10" />
<cfparam name="sel_search" default="" />
<cfparam name="use_session" default="Y" />
<cfparam name="set_session" default="Y" />
<cfparam name="sel_sortby" default="count_high" />
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Update Log</h4>
                <p class="text-muted font-13 mb-4">
                </p>
                <table id="basic-datatable" class="table dt-responsive nowrap w-100 table-striped" role="grid">
                    <thead >
                        <cfoutput query="results" maxrows="1">
                            
                            <cfif (Results.CurrentRow MOD 2)><Cfset rowtype = "Odd" /><cfelse><Cfset rowtype = "Even" /></cfif>
                                
                                
                            <tr class="#rowtype#">
                                <th>#head1#</th>
                                <th>#head2#</th>
                                <th>#head3#</th>
                                <th>#head4#</th>
                                <th>#head5#</th>
                                <th>#head6#</th>
                                <th>#head7#</th>
                            </tr>
                        </cfoutput>
                    </thead>
                    <tbody>
                        <cfoutput query="results">
                            <tr>
                                <td>#Dateformat("#results.col1#","long")#</td>
                                <td>#TimeFormat("#results.col2#","medium")#</td>
                                <td>#results.col3#</td>
                                <td>#results.col4#</td>
                                <td>#results.col5#</td>
                                <td>#results.col6#</td>
                                <td>#results.col7#</td>
                            </tr>
                        </cfoutput>
                    </tbody>
                </table>
            </div> <!-- end card body-->
        </div> <!-- end card -->
    </div><!-- end col-->
</div>


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
