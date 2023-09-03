<style>
.anchor-offset {
  box-sizing: border-box;
  padding-top: 75px;
  margin-top: -75px;
}
</style>
<cfif #isauditionmodule# is "0">
Reports are only available to users who have access to the events module.<cfabort>
</cfif>
    
 
<cfset pgcol=3 />
<cfparam name="focus_reportid" default="0" />
<cfparam name="customstart" default="2022-01-01" />
<cfparam name="customend" default="" />
<cfparam name="bookratio" default="0" />
<cfparam name="anchortag" default="" />
<cfparam name="new_audsourceid" default="0" />
    <cfparam name="new_audsourceidb" default="0" />
<cfparam name="refresh" default="y" />
    <cfif  #refresh# is "y">
    <cflocation url="/include/reportsrefresh.cfm?refresh=n" />
    </cfif>
    
    
<style>
.col-lg {
    min-width: 0;
}


     <cfif #new_rangeid# is not "7">

    #hidden_div {
        display: none;
    } 
        #hidden_divs {
        display: none;
    }
        </cfif>

</style>

<form action="/include/reportsRefresh.cfm">

               <cfoutput>
                <input type="hidden" name="refresh" value="n" />
                <input type="hidden" name="anchortag" value="" />
                <input type="hidden" name="new_audcatid" value=#new_audcatid# />
                <input type="hidden" name="new_audsourceid" value=#new_audsourceid# />
                <input type="hidden" name="new_audsourceidb" value=#new_audsourceidb# />
                <input type="hidden" name="userid" value="#userid#" />
                <input type="hidden" name="old_rangeid" value="#new_rangeid#" />
                </cfoutput>

<div class="row">

        <div class="form-group col-md-2">
            
            
               <label for="eventStart">Date Range<span class="text-danger">*</span></label>
 
        <select id="new_rangeid" name="new_rangeid" class="form-control"  onchange="this.form.submit();showDiv('hidden_div', this);showDiv('hidden_divs', this)">

 <cfoutput query="ranges">
            
          <option value="#ranges.rangeid#" <cfif #ranges.rangeid# is "#new_rangeid#"> selected </cfif>>#ranges.rangename#</option>  
</cfoutput>
        
        </select>



    </div>
    <div class="form-group col-md-2 align-bottom"></label> <BR> <input type="submit" class="btn btn-primary waves-effect waves-light" value="Refresh" /> </div>

 
<div id="hidden_div" class="form-group col-md-2">
                 <label for="customstart">Start Date</label>
                 <input id="customstart" class="form-control" autocomplete="off" value="<cfoutput>#customstart#</cfoutput>" name="customstart" type="date"  onchange="this.form.submit();" >
                 
</div>

 <div id="hidden_divs"  class="form-group col-md-2">
 
                 <label for="customend">End Date </label>
            <input id="customend" class="form-control" autocomplete="off" value="<cfoutput>#customend#</cfoutput>"  name="customend" type="date"   onchange="this.form.submit();" >
                 

                    
             </div>


</div>


</form>




<div class="row">
    <cfloop query="stats">
 

    
    
        <cfoutput>
            


            <div class="col-md-#stats.colmd# col-lg">

          <div id="#stats.reportid#" class="widget-rounded-circle card">
                                    <div class="card-body">
                                      
                                         
                                              <cfset bookratio = "#round(bookratio)#" />
                                   
                                        
                                                <div class="text-center">
                                                    <h3 class="text-dark mt-1"><span data-plugin="counterup">#statvalue#</span> <cfif #stats.reportid# is "13">(#int(bookratio)#%)</cfif></h3>
                                                    <p class="text-muted mb-1 text-truncate">#stats.reportname#</p>
                                          
                                            </div>
                                        </div> <!-- end row-->
                                    </div>
                                </div>

        
            
        </cfoutput>
        
    </cfloop>
    
</div>

<div class="row">

<cfloop query="reports">

    <cfoutput>

        <div id="anchor-#reports.reportid#"  class="col-xl-#reports.colxl# col-md-#reports.colmd# col-lg">

            <a class="anchor-offset"><div class="card"  id="#reports.reportid#" style="border: 1px solid ##e5e5e5;border-radius:3px;">

                <div class="card-body" dir="ltr">

                    <h6 class="p-1 d-flex header-title">#reports.reportname#
                        
    </cfoutput>

<span class="ms-auto">

<cfif #reports.reportid# is "2" or #reports.reportid# is "7" or #reports.reportid# is "8" >
                            
                        <form action="/app/reportsRefresh/">
                            <cfoutput>
                            <input type="hidden" name="anchortag" value="anchor-#reports.reportid#" />
                           <input type="hidden" name="new_rangeid" value="#new_rangeid#" />
                                 <input type="hidden" name="new_audsourceid" value=#new_audsourceid# />
                               <input type="hidden" name="customstart" value="#customstart#" />
                                   <input type="hidden" name="customend" value="#customend#" />
                    <input type="hidden" name="userid" value="#userid#" />
                            </cfoutput>
                            <select name="new_audcatid" onchange="this.form.submit()">
                            <Cfoutput query="categories">
                                <option value="#categories.audcatid#" <cfif #categories.audcatid# is "#new_audcatid#">Selected </Cfif>>#categories.audcatname#</option>   
                                </Cfoutput>
                            </select>
                            </form>

                        </cfif>
            
                                        <cfif #reports.reportid# is "6"  >
                                            
                                            
                                     
                                            
                                                   <cfquery datasource="#dsn#" name="audsources">
                               select audsourceid,audsource from audsources WHERE isdeleted = 0 ORDER BY audsource
                       </cfquery>
                        
                        
                        <form action="/app/reportsRefresh/">
                            <cfoutput>
                            <input type="hidden" name="anchortag" value="anchor-#reports.reportid#" />
                           <input type="hidden" name="new_rangeid" value="#new_rangeid#" />
                      <input type="hidden" name="new_audsourceid" value="#new_audsourceid#" />  
                                <input type="hidden" name="new_audcatid" value="#new_audcatid#" />  
                                
                               <input type="hidden" name="customstart" value="#customstart#" />
                                   <input type="hidden" name="customend" value="#customend#" />
                    <input type="hidden" name="userid" value="#userid#" />
                            </cfoutput>
                            
                            <select name="new_audsourceidb" onchange="this.form.submit()">
                                            <option value="0" <cfif #new_audsourceidb# is "0">Selected </Cfif>>All Sources</option>  
                                
                            <Cfoutput query="audsources">
                                <option value="#audsources.audsourceid#" <cfif #audsources.audsourceid# is "#new_audsourceidb#">Selected </Cfif>>#audsources.audsource#</option>  
                                
                                
                                </Cfoutput>
               
                            
                            
                            
                            </select>
                            
                            
                            
                            
                            
                            
                            </form>
                        
                        
                        
                        
                        
                        
                        
                        
                        </cfif>
            
            
            
            
            
            
            
            
            
            
            
            
                
                
                
                
                
                   <cfif #reports.reportid# is "18" >
                       
                       
                           <cfquery datasource="#dsn#" name="sources">
                           select audsourceid,audsource from audsources WHERE isdeleted = 0 ORDER BY audsource
                       </cfquery>
                               
                               
                        
                        
                        <form action="/app/reportsRefresh/">
                            <cfoutput>
                            <input type="hidden" name="anchortag" value="anchor-#reports.reportid#" />
                           <input type="hidden" name="new_rangeid" value="#new_rangeid#" />
                            <input type="hidden" name="new_audsourceidb" value="#new_audsourceidb#" />
                                             <input type="hidden" name="new_audcatid" value="#new_audcatid#" />
                               <input type="hidden" name="customstart" value="#customstart#" />
                                   <input type="hidden" name="customend" value="#customend#" />
                    <input type="hidden" name="userid" value="#userid#" />
                            </cfoutput>
                            
                            <select name="new_audsourceid" onchange="this.form.submit()">
                                              <Cfoutput>        <option value="0" <cfif #new_audsourceid# is "0">Selected </Cfif>>All Sources</option>  </Cfoutput> 
                            <Cfoutput query="sources">
                                <option value="#sources.audsourceid#" <cfif #sources.audsourceid# is "#new_audsourceid#">Selected </Cfif>>#sources.audsource#</option>  
                                
                                
                                </Cfoutput>
               
                            
                            
                            
                            </select>
                            
                            
                            
                            
                            
                            
                            </form>
                        
                        
                        
                        
                        
                        
                        
                        
                        </cfif>
                        
            
            
            
                        
                        
                        
                        </span>
                    </h6>
                    
                    
                    
                    
                    
                    
                    
                    
                    <cfoutput> 
                    
                    
 
        <canvas id="myChart_#reports.reportid#"></canvas>
                        
               

        </div>

        </div></a>

        </div>


    </cfoutput>

</cfloop>

<div>

</div>


            <cfloop query="reports">
                
               
                
                <cfif #reports.reportid# is "3" or #reports.reportid# is "6" or #reports.reportid# is "5" or #reports.reportid# is "7" or #reports.reportid# is "8" or #reports.reportid# is "9"  or #reports.reportid# is "2" or #reports.reportid# is "4"  or #reports.reportid# is "18" >                    
       
<cfquery datasource="#dsn#" name="reportitems_x"  > 
    SELECT 
r.reportid,
i.itemid,
i.itemLabel,
i.itemOrderNo,
i.itemValueInt,
i.itemDataset,
i.userid


FROM reportitems i 
INNER JOIN reports_user r ON r.id = i.id

WHERE i.userid= #userid# AND r.reportid = #reports.reportid#

</cfquery>
                    
                    
                    <cfquery datasource="#dsn#" name="dataset_x"  > 
    SELECT DISTINCT i.itemdataset


FROM reportitems i 
INNER JOIN reports_user r ON r.id = i.id

WHERE i.userid= #userid# AND r.reportid = #reports.reportid#
ORDER BY i.itemdataset

</cfquery>  
                    
                          
     
                    
                    
<cfquery datasource="#dsn#" name="labels_x"  > 
    SELECT 
DISTINCT i.itemlabel
FROM reportitems i 
INNER JOIN reports_user r ON r.id = i.id
WHERE i.userid= #userid# AND r.reportid = #reports.reportid#
</cfquery>
               <cfset k=0 />          
 
<cfsavecontent variable="dataset_data">            
<cfloop query="dataset_x">

    
<cfquery datasource="#dsn#" name="values_x"  >                         
SELECT DISTINCT i.itemlabel, i.itemValueInt
FROM reportitems i 
INNER JOIN reports_user r ON r.id = i.id
WHERE i.userid= #userid# AND r.reportid = #reports.reportid# AND i.itemDataset = '#dataset_x.itemdataset#'
ORDER BY i.itemlabel
</cfquery>
                                        
 <Cfoutput>
<cfset itemvalues="#ValueList(values_x.itemValueInt,",")#" />    
</Cfoutput>
    
<cfset k = #k# + 1 />        
    <cfif #k# is "1" or #k# is "3">
 <cfset bgcolor=",backgroundColor: ['##406E8E']" />
    <cfelse>
        
<cfset bgcolor=",backgroundColor: ['##1ABC9C']" />
    
    </cfif>
<cfif #k# is not "1">,</cfif><cfoutput>
{label: '#dataset_x.itemdataset#',data: [#itemvalues#]<cfif #reports.reporttypename# is not "bar">
        
        ,backgroundColor:
        [
          #reports.colorscheme#
        ] 
        
     <cfelse>
         
         #bgcolor#
    
        
        
        </cfif>}
</cfoutput>                        
</cfloop>
</cfsavecontent>                 
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                                            <cfscript>
                    reportlabels=QuotedValueList(labels_x.itemLabel,",");
                    reportvalues=QuotedValueList(reportitems_x.itemValueInt,",");
                    </cfscript>

              
                    <cfoutput>

                    <cfset reportvalues="#reportvalues#">
                    <cfset reportlabels="#reportlabels#">
              
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    <script>
                    const chart#reports.reportid# = document.getElementById('myChart_#reports.reportid#');

                    new Chart(chart#reports.reportid#, {
                        type: '#reports.reporttypename#',
                              
                        data: {
                              
                              
                              
                              
                              
                        labels: [#reportlabels#],</cfoutput>
                        datasets: [
                              

<cfoutput>#dataset_data#</cfoutput>
                              
                              ],
                              
                              },
                              
              options: {

    responsive: true,
                              
   <cfif #reports.reportid# is "4">

       scales: {


       x: {
       stacked: true,
       },
       y: {
       stacked: true
       }
       }

   </cfif>
                              
        <cfif #reports.reportid# is "9">

       scales: {


       x: {
       stacked: true,
       },
       y: {
                              
                              ticks: {
                        precision: 0
                    },
       stacked: true
                                               
             
       }
       }

   </cfif>
                                          
                              
  }
});
                    </script>
                    
              

                </cfif>
                        
                        
                        
            </cfloop>
    
                     
                    
                              <script>
                function showDiv(divId, element) {
                    var checked = document.querySelectorAll('input:checked');
                    if (checked.length === 0) {
                        document.getElementById(divId).style.display = 'none';

                    } else {
                        document.getElementById(divId).style.display = 'block';
                        $("#hidden_div").prop('required', true);
                    }
                }
            </script>
                    
                    