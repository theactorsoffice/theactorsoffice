<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery datasource="#dsn#" name="dashboardzz"   >
SELECT p.pnid, p.pntitle, p.pnColXl, p.pnColMd ,p.pnFilename,  -1 as 'new_pnorderno',p.isvisible
   FROM pgpanels_user p WHERE p.userid = #userid#  
order by p.pnorderno
</cfquery>


      <form action="/include/dashboardupdate2.cfm" method="post" class="needs-validation" validate id="profile-form">
     


          <div class="row" />


<cfloop query="dashboardzz">

 
 
    <cfif dashboardzz.isvisible eq 1>
    
    <cfoutput>
          <div class="form-group col-md-6">

              
              <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="newpnid_#dashboardzz.pnid#" checked value="#dashboardzz.pnid#" name="new_isvisible">
                  <label class="custom-control-label" for="newpnid_#dashboardzz.pnid#">#dashboardzz.pnTitle#</label>
              </div>


          </div>
        </cfoutput>
        
        <cfelse>
            
            
                <cfoutput>
          <div class="form-group col-md-6">

              
              <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="newpnid_#dashboardzz.pnid#"  value="#dashboardzz.pnid#" name="new_isvisible">
                  <label class="custom-control-label" for="newpnid_#dashboardzz.pnid#">#dashboardzz.pnTitle#</label>
              </div>


          </div>
        </cfoutput>
            
            
            </cfif>
        
        
        
</cfloop>


          <div class="form-group text-center col-md-12">
              <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: #406e8e; border: ##406e8e;">Update</button>
          </div>



          </div>
      </form>


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 
