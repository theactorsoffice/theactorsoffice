 <cfinclude template="/include/qry/myteam.cfm" />

 <div class="row">




     <cfloop query="myteam">


         <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="findtag"  >
             SELECT contactid, itemid,`contactitems`.`valueText` as tag
             FROM contactitems WHERE contactid=#myteam.contactid# AND valuetext <> 'My Team' AND valuecategory = 'Tag'
         </cfquery>

    
             
             
             

         <div class="col-md-2 col-lg-2" style="margin-top:7px;margin-left:7px;">
             <cfoutput>
                 <a href="/app/contact/?contactid=#myteam.contactid#&t1=1" class="" title="#myteam.contactname#">
                        <cfif #isimagefile("https://#host#.theactorsoffice.com/media-#host#/users/#session.userid#/contacts/#myteam.contactid#/avatar.jpg")# >
                     <img src="/media-#host#/users/#session.userid#/contacts/#myteam.contactid#/avatar.jpg?ver=#rand()#" style="width:30px;" alt="#myteam.contactname#" />
                            <cfelse>
                                  <img src="/media-#host#/defaults/avatar.jpg?ver=#rand()#" style="width:30px;" alt="#myteam.contactname#" />
                                </cfif>

                 </a>
             </cfoutput>
         </div>

             
             
             
         <div class="col-md-9 col-lg-9">
             <cfoutput>
                 <a href="/app/contact/?contactid=#myteam.contactid#&t1=1" class="" title="#myteam.contactname#">
                     #myteam.contactname#
                 </a>
                 <BR> <small> #findtag.tag# </small>
             </cfoutput>
         </div>
         <div class="col-md-12 col-lg-12">
             &nbsp;
         </div>
     </cfloop>
 </div>

 <div class="col-md-12 col-lg-12">
     <p style="text-align:center;">
         <a href="/app/myaccount/?t2=1"><i class="mdi mdi-square-edit-outline"></i></a>
     </p>
 </div>

 <cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" />
         <cfinclude template="/include/bigbrotherinclude.cfm" /> 