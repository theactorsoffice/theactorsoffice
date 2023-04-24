<style>
    #hidden_div {
        display: none;
    }
</style>



<CFINCLUDE template="/include/remote_load.cfm" />
<cfquery name="tags" datasource="#dsn#" >
SELECT  * from tags_user where userid = #session.userid# 
    
    order by tagname
</cfquery>

                    <cfquery name="companies" datasource="#dsn#">
                SELECT DISTINCT i.valueCompany as new_valuecompany
                FROM contactitems i
                INNER JOIN contactdetails d ON d.contactid = i.contactid
                WHERE i.VALUEcategory = 'company' AND d.userid = #userid#
                AND i.valuecompany <> '' AND i.valueCompany IS NOT NULL
                and i.valuecompany <> 'Custom'
                    ORDER BY i.valuecompany
            </cfquery>
             
                        
                        


<form action="/include/remoteAddContactAddaud.cfm" method="post"  class="needs-validation"  id="profile-form">
    <cfoutput>

          <input type="hidden" name="audprojectid" value="#audprojectid#" >
<input type="hidden" name="userid" value="#userid#" >
        <input type="hidden" name="src" value="#src#" >
    </cfoutput>
    
    
        <div class="row" />
 
     
        

    
                <div class="form-group col-md-6">
          <label for="contactFirst">First Name:</label>
 
          <input class="form-control" type="text" id="contactFirst" name="contactFirst"   required placeholder="Enter First Name">
 
           
                </div>
    
                 

                        <div class="form-group required  col-md-6">
          <label for="contactFirst">Last Name:</label>
 
          <input class="form-control" type="text" id="contactLast" name="contactLast"    placeholder="Enter Last  Name">
 
            
                </div>
    
    
                <div class="form-group col-md-6">
                    <label for="company">Company<span class="text-danger">*</span></label>
    

            <select id="company" name="company" class="form-control"  onchange="showDiv('hidden_div', this)">


                <option value=""></option>
                <cfoutput query="companies">
                    <option value="#companies.new_valuecompany#">#companies.new_valuecompany# </option>


        </cfoutput>
        <option value="Custom">***ADD NEW***</option>

        </select>

        </div>
                        
       <div id="hidden_div" class="form-group col-md-6">
       
                    <label for="company_new">Custom Company<span class="text-danger">*</span></label>

                <input class="form-control" type="text" id="company_new" name="company_new" value="" placeholder="Enter Company">


        </div>            
                        
        
       
        
   
    
    
                    <div class="form-group col-sm-6 mb-6">
                     
                     
                               <label for="tag">Type</label>
                     
    
                  <select id="new_tag" name="new_tag" required class="form-control">
                                                        <option value="">Select a type</option>
                                               <cfloop query="tags">
                                                
                                                   <cfoutput>
                                                       <option value="#tags.tagname#"  >#tags.tagname#</option>
                                                 
                                                 </cfoutput>
                                                 </cfloop>
                                                    </select>
    
    
    
    </div>

    
 
               <div class="form-group col-md-6">
          <label for="workphone">Phone:</label>
 
          <input class="form-control" type="text" id="workphone" name="workphone"    placeholder="Enter Work Phone">
 
                <div class="invalid-feedback">
                    Please add work phone.
                </div>
                </div>
        

               <div class="form-group col-md-6">
          <label for="workemail">Email:</label>
 
          <input class="form-control" type="text" id="workemail" name="workemail"    placeholder="Enter Email">
 
          
                </div>
        
    
    
    
    
    
    
</div>



      <div class="form-group text-center col-md-12"><p>
                            <button class=" btn btn-primary editable-submit btn-sm waves-effect waves-light" type="submit" style="background-color: #406e8e; border: #406e8e;">Add</button></p>
                        </div>

      
    
    </div>
</form>


        <script>
function showDiv(divId, element)
{
    document.getElementById(divId).style.display = element.value == "Custom" ? 'block' : 'none';
}
        </script>


<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 


