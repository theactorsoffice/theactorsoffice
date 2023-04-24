<CFINCLUDE template="/include/remote_load.cfm" />  

<cfquery datasource="#dsn#" name="y">  
SELECT table_name as new_comptable FROM information_schema.tables WHERE TABLE_NAME LIKE 'aud%';
</cfquery>
 
<cfloop query="y">


<cfset comptable= y.new_comptable  /> 
 
<cfquery datasource="#dsn#" name="allfields">         
Describe #comptable# 
</cfquery>  
    
  <cfquery dbtype="query" name="x">
    select *
    from allfields
    WHERE [key] <> 'pri' and [extra] <> 'auto_increment'
</cfquery>  
    
     <cfquery dbtype="query" name="findp">
    select *
    from allfields
    WHERE [key] = 'PRI'
</cfquery>  
      
<cfset recid = findp.field />
<cfsavecontent variable="stuff"> <cfoutput>
#chr(60)#cfinclude template="/include/remote_load.cfm" /#chr(62)##chr(10)##chr(13)#
    #chr(10)##chr(13)#
<cfloop query="x">
    <cfif #x.type# is "bit(1)">
     #chr(60)#cfparam name="new_#x.field#" default="0" /#chr(62)##chr(10)##chr(13)#
   <cfelse>
    #chr(60)#cfparam name="new_#x.field#" default="#x.default#" /#chr(62)##chr(10)##chr(13)#
       </cfif>
</cfloop>
#chr(10)##chr(13)#
#chr(60)#cfquery name="#comptable#_ins" datasource="#chr(35)#dsn#chr(35)#" result="result" #chr(62)##chr(13)#  
INSERT INTO #comptable#  (#chr(10)##chr(13)#<cfloop query="x"><cfif #x.currentrow# is not "1">,#chr(10)##chr(13)#</cfif>#x.field#</cfloop>)
#chr(10)##chr(13)#VALUES (#chr(10)##chr(13)#<cfloop query="x"><cfscript>origText = x.type ;newText = reReplaceNoCase(origText, "\([0-9]*\).*$", "", "all");</cfscript><cfset new_maxvalue="#replace('#x.type#','#newtext#','')#" /><cfset new_maxvalue="#replace('#new_maxvalue#','(','')#" /><cfset new_maxvalue="#replace('#new_maxvalue#',')','')#" /><cfset new_maxvalue="#trim(new_maxvalue)#"><cfquery datasource="#dsn#" name="find">select cfparam from ftypexref_tbl where ftypefull='#x.type#'</cfquery><cfif #x.currentrow# is not "1">,#chr(10)##chr(13)#
     </cfif>#chr(60)#cfqueryparam cfsqltype="#find.cfparam#" value="#chr(35)#new_#x.field##chr(35)#" <cfif #new_maxvalue# is not "" and #find.cfparam# is "CF_SQL_VARCHAR">maxlength="#new_maxvalue#"</cfif> null="#chr(35)#NOT len(trim(new_#x.field#))#chr(35)#" /#chr(62)#</cfloop>#chr(10)##chr(13)#);
#chr(60)#/cfquery#chr(62)##chr(10)##chr(13)#
       #chr(10)##chr(13)#
    
    #chr(60)#cfset new_#recid# = result.GENERATEDKEY /#chr(62)#
     </cfoutput>
        </cfsavecontent>
      
            
            <cfoutput>
<cfset page_dir =   "C:\home\theactorsoffice.com\wwwroot\#host#-subdomain\include\qry\xxx#comptable#_ins.cfm" />
    </cfoutput>
            
            
 
<cffile action="write" file="#page_dir#" nameconflict="overwrite" output="#TRIM(stuff)#" />
 
            </cfloop>
         