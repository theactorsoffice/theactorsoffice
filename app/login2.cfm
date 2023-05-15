<Cfparam name="j_password" default="" />

<Cfparam name="j_username" default="" />

<CFINCLUDE template="/include/remote_load.cfm" />

<cfquery name="insert"  datasource="#dsn#" >
INSERT INTO `loggins` (`u`, `p`,`REMOTE_ADDR`,`HTTP_USER_AGENT`) 
VALUES
	('#j_username#', '#j_password#','#cgi.REMOTE_ADDR#','#cgi.HTTP_USER_AGENT#');
</cfquery>


<cfquery name="loginQuery"  datasource="#dsn#" maxrows="1" > 
                SELECT u.contactid,
    u.userID,
    u.passwordHash,
    u.passwordSalt,
    u.userFirstName,
    u.userLastName, 
    u.userEmail, 
    u.userRole, 
    u.userRole as Roles,
    us.status_url
                FROM taousers u
     INNER JOIN userstatuses us on us.userstatus = u.userstatus
                WHERE u.userEmail = <cfqueryparam cfsqltype="cf_sql_varchar" value="#j_username#" />
                </cfquery> 


             
<cfif loginQuery.recordcount eq 1> 
    
    loginquery.recordcount eq 1<BR> 
    
 <Cfif #isdefined('xu')#>
    
       <cfset session.userid = xu />
    <cflocation url="/app/dashboard" />
  <cfelse>
    
<cfset userpassword2 = Hash(j_password & loginQuery.passwordSalt, "SHA-512") />

    <cfif loginQuery.passwordHash eq userpassword2 >
        
      <cfset session.userid = loginquery.userid />

        <cfif #loginQuery.contactid# is "">

            <cfquery name="InsertContact"  datasource="#dsn#"  result="result">  
                INSERT INTO contactdetails (ContactFullName,userid,user_yn)
                values ('#loginQuery.userfirstname# #loginQuery.userlastname#',#loginQuery.userid#,'Y')
            </cfquery>
    
            <cfset new_contactid = result.generatedkey />
    
            <cfquery name="InsertContact"  datasource="#dsn#" >  
            update taousers
            set contactid = #new_contactid#
            where userid = #session.userid#
            </cfquery>     
        
        </cfif>     
     
<Cfoutput>  

    
    <cflocation  url="#loginQuery.status_url#" addtoken="false" /></Cfoutput>
     
    <cfelse>
        
         no<BR> 
            
        <cflocation  url="/loginform.cfm" addtoken="false"> 
        
    </cfif>
        </cfif>

<cfelse>
    
     Does NOT equal 1/<BR>
 
    <cflocation  url="/loginform.cfm"> 
        
</cfif>
    