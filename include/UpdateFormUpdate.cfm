<cfinclude template="rpg_load.cfm" />

<cfparam name="OldValue" default="" />

<cfparam name="Recordname" default="" />

<cfparam name="NewValue" default="" />

<cfparam name="updatename" default="" />

<cfparam name="recid" default="0" />

<cfparam name="updatedetails" default="" />

<cfparam name="loginname" default="" />

  <cfparam name="isdeleted" default="0" />

<cfparam name="t1" default="0" />

<cfparam name="t2" default="0" />

<cfparam name="t3" default="0" />

<cfparam name="t4" default="0" />

<cfparam name="contactid" default="0" />


 <cfparam name="new_isDeleted" default="0" />



<cfoutput>



    <cfparam name="userid" default="#session.userid#" />

    <cfparam name="compid" default="#rpg_compid#" />

    <cfparam name="compTable" default="#rpg_comptable#" />

    <cfparam name="recname" default="#fid#" />

    <cfparam name="compName" default = "#rpg_compname#" />
    
    
    userid: #session.userid#<BR>
    compid: #rpg_compid#<BR>
    comptable: #rpg_comptable#<BR>
    recname: #fid#<BR>
    compname: #rpg_compname#<BR>

</cfoutput>


<cfloop query="rpgupdate">

    <Cfif #rpgupdate.fname# is not "#fid#">
    
    <cfoutput>
<cfset fname = "#rpgupdate.Fname#" />
<cfset ftype = "#rpgupdate.ftype#" />
    fname: #rpgupdate.Fname#<BR>
    ftype: #rpgupdate.ftype#<BR>
        
        <cfif #ftype# is "integer">
            
            <cfset fsqltype = "CF_SQL_INTEGER" />
        
        <cfelseif #ftype# is "text">
            
            <cfset fsqltype = "CF_SQL_VARCHAR" />
            
        <cfelseif #ftype# is "date">
            
            <cfset fsqltype = "CF_SQL_DATE" />
            
        <cfelseif #ftype# is "datetime">
            
            <cfset fsqltype = "CF_SQL_TIMESTAMP" />
            
        <cfelseif #ftype# is "time">
            
            <cfset fsqltype = "CF_SQL_TIME" />
                <cfelseif #ftype# is "bit">
            
            <cfset fsqltype = "CF_SQL_BIT" />
            
        </cfif>
    </cfoutput>


<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="FindOld"   >
Select c.#fname# as OldValue,
recordname
    
from #compTable# c #compInner#
WHERE c.#recname# = #recid#
</cfquery>


<cfset recordname = FindOld.recordname />

<cfoutput>
Find old query: Select c.#fname# as OldValue,
recordname
    
from #compTable# c #compInner#
WHERE c.#recname# = #recid#<BR>
    
    recordname: #recordname#<BR>

    
<cfset NewValue = "#EVALUATE('new_#FNAME#')#" />

<cfset OldValue = "#FindOld.OldValue#" />
    
<CFSET updatedname = "#rpgupdate.updatename#" />
    #fname#<BR>
     Newvalue: #Newvalue#<BR>
     oldvalue: #oldvalue#<BR>
     updatename: #updatename#<BR>
</cfoutput>



<CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="FindUser"   >
SELECT u.recordname as updateusername
FROM taousers u
WHERE userid = <Cfqueryparam value="#userid#" cfsqltype="CF_SQL_INTEGER" />
</cfquery>

<cfoutput>

    <cfset updateusername = "#FindUser.updateusername#" />
       updateusername: #updateusername#<BR>

    <Cfif "#oldvalue#" is "">

        <cfset oldvalue = "NULL" />

    </Cfif>

    <Cfif "#newvalue#" is "">

        <cfset newvalue = "NULL" />

    </Cfif>
    
      <cfset updatedetails = "<span style='color: ##406E8E;font-weight:400;'>#oldvalue#</span> to <span style='color: ##406E8E;font-weight:400;'>#newvalue#</span>" />
    
updatedetails: #updatedetails#<BR>
    </cfoutput>

<cfif oldvalue neq newvalue >

    
    <cfoutput>
    
        UPDATE #compTable#<BR>
    Set #fname# = "#newvalue#"<BR>
    where #recname# ="#recid#" <BR> 
    </cfoutput> 
    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="update"      >
    UPDATE #compTable#
    Set #fname# = <Cfqueryparam value="#newvalue#" cfsqltype="#fsqltype#" />
    where #recname# =<Cfqueryparam value="#recid#" cfsqltype="#fidsqltype#" />
    </cfquery> 

    <CFINCLUDE template="/include/remote_load.cfm" /><cfquery datasource="#dsn#" name="INSERT"   >	
    INSERT INTO updatelog (oldValue,NewValue,recordname,updatename,recid,compid,userid,updatedetails)
    VALUES (<Cfqueryparam value="#oldvalue#" cfsqltype="CF_SQL_VARCHAR" />,
        <Cfqueryparam value="#newvalue#" cfsqltype="CF_SQL_VARCHAR" />,
        <Cfqueryparam value="#recordname#" cfsqltype="CF_SQL_VARCHAR" />,
        <Cfqueryparam value="#updatename#" cfsqltype="CF_SQL_VARCHAR" />,
        <Cfqueryparam value="#recid#" cfsqltype="CF_SQL_INTEGER" />,
        <Cfqueryparam value="#compid#" cfsqltype="CF_SQL_INTEGER" />,
        <Cfqueryparam value="#userid#" cfsqltype="CF_SQL_INTEGER" />,
        <Cfqueryparam value="#updatedetails#" cfsqltype="CF_SQL_VARCHAR" />)
    </cfquery>	
    
    <cfoutput>
            INSERT INTO updatelog (oldValue,NewValue,recordname,updatename,recid,compid,userid,updatedetails)
    VALUES (#oldvalue#,
        #newvalue#,
        #recordname#,
        #updatename#,
        #recid#,
        #compid#,
        #userid#"
        #updatedetails#)
        
        </cfoutput>
    
</cfif>

</Cfif>
    <p></p>
        </cfloop>


<cfoutput>

<cfset returnpage = "/app/#rpg_compDir#/" />
 
    
    
    <cfif #isdefined('dbug')#>
        
        Recid: #recid#<BR>
        contactid:#contactid#
       URL: /app/#pgDir#/?recid=#recid#&contactid=#contactid#&t1=#t1#&t2=#t2#&t3=#t3#&t4=#t4#<BR>
    <cfabort>
    </cfif>
        
        
 </cfoutput>
		
		
<cfset script_name_include="/include/#ListLast(GetCurrentTemplatePath(), "\")#" /><cfinclude template="/include/bigbrotherinclude.cfm" /> 

         
            <cflocation url="/app/#pgDir#/?recid=#recid#&contactid=#contactid#&t1=#t1#&t2=#t2#&t3=#t3#&t4=#t4#" />

 


 

