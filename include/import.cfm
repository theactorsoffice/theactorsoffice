<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Import Details </h4>



                <div class="d-flex justify-content-between">

                    <div class="float-left">


                        <a title="View All" href="/app/contacts-import/">

                            <i class="mdi mdi-eye-outline"></i> View All
                        </a>






                    </div>

                    <div class="dropdown float-end">

          

                    </div>

                </div>


                <div class="row">

<cfoutput query="details">


                    <div class="col-3">

                        <p class="mt-2 mb-0 font-weight-bold">Batch ID</p>

                        <div class="media">

                            <div class="media-body">

                                <div class="mt-0 font-size-12">
                                    #details.uploadid#


                                </div>

                            </div>

                        </div>

                    </div>








                    <div class="col-3">

                        <p class="mt-2 mb-0 font-weight-bold">Date</p>

                        <div class="media">

                            <div class="media-body">

                                <div class="mt-0 font-size-12">
                                                       #dateformat(details.timestamp)# 
                                    
           
                                        


                                </div>

                            </div>

                        </div>

                    </div>





                    <div class="col-3">

                        <p class="mt-2 mb-0 font-weight-bold">Time</p>

                        <div class="media">

                            <div class="media-body">

                                <div class="mt-0 font-size-12">
                                                       #timeformat(details.timestamp)# 
                                    
           
                                        


                                </div>

                            </div>

                        </div>

                    </div>



                    <div class="col-3">

                        <p class="mt-2 mb-0 font-weight-bold">Status</p>

                        <div class="media">

                            <div class="media-body">

                                <div class="mt-0 font-size-12">
                                    #details.uploadstatus#
                                    
                                    


                                </div>

                            </div>

                        </div>

                    </div>




                    </cfoutput>






                </div>
            </div>
        </div>
    </div>
</div>























    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="results"      >
SELECT d.contactid,
'Name' as 'head1',
'Tags' as 'head2',
'Phone' as 'head3',
'Email' as 'head4',
'Company' as 'head5',
'Status' as 'head6',
        c.status,
d.contactfullname AS col1
,(SELECT GROUP_CONCAT(CONCAT("<span class='badge badge-blue'>",valueText,"</span>") separator ' ')
			FROM contactitems 
			WHERE valueCategory = 'Tag' 
			AND contactID = d.ContactID AND itemstatus = 'Active' LIMIT 1) AS col2

,   (SELECT valueText 
			FROM contactitems 
			WHERE valueCategory = 'Phone'
			AND contactID = d.ContactID AND itemstatus = 'Active' limit 1) AS col3
			
,   (SELECT valueText 
			FROM contactitems 
			WHERE valueCategory = 'Email' 
			AND contactID = d.ContactID AND itemstatus = 'Active' limit 1) AS col4	
			
			
,   (SELECT valueCompany
			FROM contactitems 
			WHERE  contactID = d.ContactID and valueCategory = 'Company' and itemstatus = 'active' limit 1) AS col5
				
FROM contactdetails d
        inner join contactsimport c on c.contactid = d.contactid

WHERE c.uploadid = <Cfqueryparam value="#uploadid#" cfsqltype="CF_SQL_INTEGER" />
    
 
    
     
  
	
ORDER BY d.contactfullname
</cfquery>


<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                
                
                

<h6><cfoutput>#results.recordcount# relationship contacts were imported. Click on a name to view details.</cfoutput></h6>
  <table id="basic-datatable" class="table display dt-responsive nowrap w-100 table-striped" role="grid">
                    <thead>
                        <cfoutput query="results" maxrows="1">

                            <cfif (Results.CurrentRow MOD 2)>
                                <Cfset rowtype="Odd" />
                                <cfelse>
                                    <Cfset rowtype="Even" />
                            </cfif>


                            <tr class="#rowtype#">
                                <th>#head1#</th>
                                <th>#head2#</th>
                                <th>#head3#</th>
                                <th>#head4#</th>
                                <th>#head5#</th>
                                     <th>#head6#</th>

                            </tr>
                        </cfoutput>
                    </thead>
                    <tbody>
                        <cfloop query="results">

<cfset phonenumber = results.col3 />
                    
<cfset cleanPhoneNumber = reReplace(phoneNumber, "[^0-9]", "", "ALL")>
    
<cfif "#len(cleanPhoneNumber)#" is "10">
 
    <cfoutput>
    <cfset formatPhoneNumber = "(#left(cleanPhoneNumber, 3)#) #mid(cleanPhoneNumber, 4, 3)#-#right(cleanPhoneNumber, 4)#" />
    <cfset anchorPhoneNumber = "#left(cleanPhoneNumber, 3)#-#mid(cleanPhoneNumber, 4, 3)#-#right(cleanPhoneNumber, 4)#" />
        
        </cfoutput>
        
<cfelse>
    <Cfoutput>
    <cfset formatPhoneNumber = "#phoneNumber#*" /> 
    <cfset anchorPhoneNumber = "#cleanPhoneNumber#*" /> 
        </Cfoutput>
    </cfif>
        
        
            
                    

                            <cfoutput>



                                <cfset cur_link="/app/contact/index.cfm?contactid=#results.contactid#" />



                                <tr role="row">
                                    <th>

                                        <a href="#cur_link#" class="text-body font-weight-semibold">

                                            #results.col1#

                                        </a>
                                    </th>
                                    <td>#col2#</td>
                                    <td><a href="tel:#anchorPhoneNumber#">#formatPhoneNumber#</a></td>
                                    <td>#col4#</td>
                                    <td>#col5#</td>
                                    <td><cfif #status# is not "Added"><font color="red"></cfif>#status#<cfif #status# is not "Added"></font></cfif></td>

                                </tr>
                            </cfoutput>
                        </cfloop>
                    </tbody>
                </table>
                        
      </div></div></div></div>                    
                        