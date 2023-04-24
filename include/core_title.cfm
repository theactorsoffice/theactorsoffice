<cfparam name="ctaction" default="view">
    
    

<div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"> <a href="<cfoutput>#home#/</cfoutput>">
                                                    <cfoutput>#appName# </cfoutput>
                                                </a>
                                            </li>

                                            <li class="breadcrumb-item"><a href="<cfoutput>/app/#compdir#</cfoutput>">
                                                    <cfoutput>#compName#</cfoutput>
                                                </a></li>


                                            <li class="breadcrumb-item active">
                                                <cfoutput>#pgName# </cfoutput>
                                            </li>


                                        </ol>
                                    </div>
                                    
                                    
                                    
                                    <h4 class="page-title">
                                        <cfoutput>
                                            <cfif #session.userid# is "3887989780">#pgid# </cfif>#pgHeading#
                                            
                                            <cfif #pgid# is "189">(#rangedisplay#)  </cfif>
                                            
                                            <cfif #pgid# is "175">: #projectdetails.projName# <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteDeleteFormAudproject#projectdetails.audprojectid#" data-bs-placement="top" title="Delete Project" data-bs-original-title="Delete Project"> 
                               <i class="fe-trash-2"></i></a></cfif>
                                            
                                            
                                            <cfif #pgid# is "117">               <a href="javascript:;" data-bs-remote="true" data-bs-toggle="modal" data-bs-target="##remoteDeleteForm#contactid#" data-bs-placement="top" title="Delete Croject" data-bs-original-title="Delete Contact"><i class="fe-trash-2"></i></a></cfif>
                                            
                                            
                                            
                                            
                                            <A href="" data-bs-toggle="modal" data-bs-target="##custom-modal-diagnostic"></A>

                                            <cfif #pgid# is "89">
                                                <cfset session.pgrtn="D" />
                                                <span style="font-size:14px;"><a style="color: ##406e8e !important;" data-bsremote="true" data-bs-toggle="modal" data-bs-target="##paneladd" title="Add Custom Panel"><i class="fe-plus-circle"></i></a></span>
                                                
                                                
                                                <cfif #ctaction# is "view">
                                                    <cfif #isdefined('sdfsdfdsfsdfs')#>
                                                           <span style="font-size:14px;"><a style="color: ##406e8e !important;" title="Edit Configuration" href="/app/dashboard/?ctaction=config"><i class="mdi mdi-cog-outline"></i></a></span></cfif>
                                                    
                                                    <cfelse>
                                                        
                                                          <span style="font-size:14px;"><a style="color: ##406e8e !important;" title="Edit Configuration" href="/app/dashboard/?ctaction=view"><i class="mdi mdi-cog-outline"></i></a>   </span>     <span style="color:green;margin-left:20px;">Drag your panels to a new order and press the button.  </span>

                                            </cfif>

                                                </cfif>
                                            <cfif #pgid# is "5">
                                                <cfparam name="rcontactid" default="0" />
                                                <cfset session.pgrtn="D" />
                                                <span style="font-size:14px;"><a href="/app/appoint-add/?returnurl=calendar-appoint&amp;rcontactid=#rcontactid#&pgrtn=D" style="color: ##406e8e !important;" title="Add Appointment"><i class="fe-plus-circle"></i></a></span>

                                            </cfif>

                                        </cfoutput>
                                    </h4>
                                    
 
                                </div>
                            </div>
       