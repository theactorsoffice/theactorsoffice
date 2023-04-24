 <cfinclude template="/include/qry/birthdays.cfm" />
 <div class="row">
     <cfif #birthdays.recordcount# is "0">
         <div class="col-md-12 col-lg-12">
             <p style="text-align:center;">No birthdays to show.</p>
         </div>
         <Cfelse>

  
             
             
             
             
             <cfloop query="birthdays">
             
             
         <div class="col-md-2 col-lg-2" style="margin-top:7px;margin-left:7px;">
             <cfoutput>
                 <a href="/app/contact/?contactid=#birthdays.contactid#&t1=1" class="" title="#birthdays.col1#">
                     <cfif #isimagefile("https://#host#.theactorsoffice.com/media-#host#/users/#session.userid#/contacts/#birthdays.contactid#/avatar.jpg")# >
                     <img src="/media-#host#/users/#session.userid#/contacts/#birthdays.contactid#/avatar.jpg?ver=#rand()#" style="width:30px;" alt="#birthdays.col1#" />
                         
                         <cfelse>
                          
                              <img src="/media-#host#/defaults/avatar.jpg?ver=#rand()#" style="width:30px;" alt="#birthdays.col1#" />
                             
</cfif>
                 </a>
             </cfoutput>
         </div>

             
             
             
         <div class="col-md-9 col-lg-9">
             <cfoutput>
                 <a href="/app/contact/?contactid=#birthdays.contactid#&t1=1" class="" title="#birthdays.col1#">
                     #birthdays.col1#
                 </a>
                 <BR> <small> #birthdays.col2# </small>
             </cfoutput>
         </div>
         <div class="col-md-12 col-lg-12">
             &nbsp;
         </div>
             
             
             
             </cfloop>
             
             
             
             
             
             
             
             

 </cfif>
         
         
         
         
         
         
         
         
         

 </div>

    <cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), " \")#" />
    <cfinclude template="/include/bigbrotherinclude.cfm" />