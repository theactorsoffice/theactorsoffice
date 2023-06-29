<CFINCLUDE template="/include/remote_load.cfm" />

<cfinclude template="/include/qry/materials_sel_unused.cfm" />
<cfparam name="placeholder" default="" />

<cfquery name="FindUser" datasource="#dsn#">
    SELECT
    u.userid
    ,u.recordname
    ,u.userFirstName
    ,u.userLastName
    ,u.userEmail
    ,u.contactid
    ,u.userRole
    ,u.calstarttime
    ,u.calendtime
    ,u.avatarname
    ,u.IsBetaTester
    ,u.defRows
    
    
    ,u.contactid AS userContactID
    ,u.tzid
    FROM taousers u
    WHERE u.userid = '#session.userid#'
</cfquery>

   <cfquery datasource="#dsn#" name="Type"  >             
SELECT mediatypeid,mediatype from audmediatypes WHERE mediatypeid in (1,2,3,5,6,7,8)
                </cfquery> 

 


     <div class="row" />
 <cfloop query="headshots_sel">
     
 
   <Cfoutput>
 
            <div class="col-sm-12">





 
                    <center>
   
<A href="/include/remoteselectedmaterial2.cfm?selected_eventid=#selected_eventid#&mediaid=#headshots_sel.mediaid#&eventid=#eventid#&audprojectid=#audprojectid#"> 
<img src="https://#host#.theactorsoffice.com/media-#host#/filetypes/#headshots_sel.mediaext#.png?ver=#rand()#" class="mr-2 rounded-square gambar  img-thumbnail img-fluid p-0 m-0" style="width:120px;" title="User ID: 30" alt="profile-image" id="item-img-output">
</center>
    <center>
        #headshots_sel.mediatype#<Br/>
        #headshots_sel.medianame#


                        </a>
              
                    </centER>
       

                    <p class="p-0" style="padding:10px;">
                        <center>

                            <a  href="/include/remoteselectedmaterial2.cfm?eventid=#selected_eventid#&mediaid=#headshots_sel.mediaid#&audprojectid=#audprojectid#" title="Select" data-bs-original-title="Add media" class="btn btn-xs btn-primary waves-effect waves-light">Select</a>
                        </center>
         

                <BR/>
         
                </p>


                <span class="p-3">&nbsp;</span> <span class="p-3">&nbsp;</span>
            </div>


        </Cfoutput>
 
    </cfloop>
                
                
                
                
</div>
        
 
