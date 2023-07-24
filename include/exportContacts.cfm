    <cfparam name="new_exportid" default="" />
    <cfparam name="new_contactid" default="" />
    <cfparam name="new_FirstName" default="" />
    <cfparam name="new_LastName" default="" />
    <cfparam name="new_Tag1" default="" />
    <cfparam name="new_Tag2" default="" />
    <cfparam name="new_Tag3" default="" />
    <cfparam name="new_BusinessEmail" default="" />
    <cfparam name="new_PersonalEmail" default="" />
    <cfparam name="new_WorkPhone" default="" />
    <cfparam name="new_MobilePhone" default="" />
    <cfparam name="new_HomePhone" default="" />
    <cfparam name="new_Company" default="" />
    <cfparam name="new_Address" default="" />
    <cfparam name="new_Address2" default="" />
    <cfparam name="new_City" default="" />
    <cfparam name="new_State" default="" />
    <cfparam name="new_Zip" default="" />
    <cfparam name="new_Country" default="" />
    <cfparam name="new_ContactMeetingDate" default="" />
    <cfparam name="new_ContactMeetingLocation" default="" />
    <cfparam name="new_contactbirthday" default="" />
    <cfparam name="new_Website" default="" />
    <cfparam name="idlist" default="0" />

    <CFINCLUDE template="/include/remote_load.cfm" />

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

    <cfquery name="AddExport" datasource="#dsn#" result="result">
        INSERT INTO `exports` (`userid`)
        VALUES (#session.userid#)
    </cfquery>

    <cfset new_exportid=result.generatedkey />
    <cfquery name="x" datasource="#dsn#">
        SELECT
        contactid as new_contactid,
        SUBSTRING_INDEX(contactfullname, ' ', 1) AS new_FirstName,
    SUBSTRING(contactfullname, LENGTH(SUBSTRING_INDEX(contactfullname, ' ', 1))+2) AS new_LastName,
        contactmeetingdate as new_contactmeetingdate,
        ContactMeetingLoc as new_ContactMeetingLoc,
        contactbirthday as new_contactbirthday

        from `contactdetails` `d`
        where `d`.`contactStatus` = <cfqueryparam cfsqltype="cf_sql_varchar" value="Active">
            and d.userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">
                and d.contactid in (#idlist#)
    </cfquery>
        
  
    <cfloop query="x">
        <cfset new_Tag1="" />
        <cfset new_Tag2="" />
        <cfset new_Tag3="" />
        <cfset new_BusinessEmail="" />
        <cfset new_PersonalEmail="" />
        <cfset new_WorkPhone="" />
        <cfset new_MobilePhone="" />
        <cfset new_HomePhone="" />
        <cfset new_Company="" />
        <cfset new_Address="" />
        <cfset new_Address2="" />
        <cfset new_City="" />
        <cfset new_State="" />
        <cfset new_Zip="" />
        <cfset new_Country="" />
        <cfset new_Website="" />
        <cfset new_contactid=x.new_contactid />
        <cfset new_FirstName=x.new_FirstName />
        <cfset new_LastName=x.new_LastName />
        <cfset new_contactmeetingdate=x.new_contactmeetingdate />
        <cfset new_ContactMeetingLoc=x.new_ContactMeetingLoc />
        <cfset new_contactbirthday=x.new_contactbirthday />

        <cfquery name="find_new_Website" datasource="#dsn#" maxrows="1">
            SELECT valuetext AS new_website
            FROM contactitems
            WHERE valuetype =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Company Website" />
            AND contactid =
            <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />
            AND itemstatus =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="URL" />
        </cfquery>


        <cfif find_new_Website.recordcount eq 1>

            <cfset new_website=find_new_Website.new_website />

        </cfif>

        <cfquery name="find_new_BusinessEmail" datasource="#dsn#" maxrows="1">
            SELECT valuetext AS new_businessEmail
            FROM contactitems
            WHERE valuetype =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Business" />
            AND contactid =
            <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />
            AND itemstatus =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Email" />
        </cfquery>

        <cfif find_new_BusinessEmail.recordcount eq 1>

            <cfset new_businessEmail=find_new_BusinessEmail.new_businessEmail />

        </cfif>

        <cfquery name="find_new_PersonalEmail" datasource="#dsn#" maxrows="1">
            SELECT valuetext AS new_PersonalEmail
            FROM contactitems
            WHERE valuetype =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Personal" />
            AND contactid =
            <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />
            AND itemstatus =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Email" />
        </cfquery>


        <cfif find_new_PersonalEmail.recordcount eq 1>

            <cfset new_PersonalEmail=find_new_PersonalEmail.new_PersonalEmail />

        </cfif>

        <cfquery name="find_new_Company" datasource="#dsn#" maxrows="1">
            SELECT valuecompany AS new_Company
            FROM contactitems
            WHERE contactid =
            <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />
            AND itemstatus =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Company" />
        </cfquery>

        <cfif find_new_Company.recordcount eq 1>

            <cfset new_Company=find_new_Company.new_Company />

        </cfif>

        <cfquery name="find_new_WorkPhone" datasource="#dsn#" maxrows="1">
            SELECT valuetext AS new_WorkPhone
            FROM contactitems
            WHERE valuetype =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Work" />
            AND contactid =
            <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />
            AND itemstatus =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Phone" />
        </cfquery>

        <cfif find_new_WorkPhone.recordcount eq 1>

            <cfset new_WorkPhone=find_new_WorkPhone.new_WorkPhone />

        </cfif>

        <cfquery name="find_new_mobilePhone" datasource="#dsn#" maxrows="1">
            SELECT valuetext AS new_mobilePhone
            FROM contactitems
            WHERE valuetype =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="mobile" />
            AND contactid =
            <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />
            AND itemstatus =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Phone" />
        </cfquery>

        <cfif find_new_mobilePhone.recordcount eq 1>

            <cfset new_mobilePhone=find_new_mobilePhone.new_mobilePhone />

        </cfif>

        <cfquery name="find_new_homePhone" datasource="#dsn#" maxrows="1">
            SELECT valuetext AS new_homePhone
            FROM contactitems
            WHERE valuetype =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="home" />
            AND contactid =
            <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />
            AND itemstatus =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Phone" />
        </cfquery>

        <cfif find_new_homePhone.recordcount eq 1>

            <cfset new_homePhone=find_new_homePhone.new_homePhone />

        </cfif>

        <cfquery name="find_new_address" datasource="#dsn#" maxrows="1">
            SELECT valuestreetaddress AS new_address,
            valueextendedaddress new_address2,
            valuecity AS new_city,
            valueregion new_state,
            valuepostalcode AS new_zip
            FROM contactitems
            WHERE valuetype =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Business" />
            AND contactid =
            <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />
            AND itemstatus =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND valuecategory =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Address" />
        </cfquery>

        <cfif find_new_address.recordcount eq 1>

            <cfset new_address=find_new_address.new_address />
            <cfset new_address2=find_new_address.new_address2 />
            <cfset new_city=find_new_address.new_city />
            <cfset new_state=find_new_address.new_state />
            <cfset new_zip=find_new_address.new_zip />
        </cfif>

        <cfif find_new_address.recordcount eq 0>

            <cfquery name="find_new_address_other" datasource="#dsn#" maxrows="1">
                SELECT valuestreetaddress AS new_address,
                valueextendedaddress new_address2,
                valuecity AS new_city,
                valueregion new_state,
                valuepostalcode AS new_zip,
                valueCountry new_country
                FROM contactitems
                WHERE contactid =
                <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />
                AND itemstatus =
                <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
                AND valuecategory =
                <cfqueryparam cfsqltype="cf_sql_varchar" value="Address" />
            </cfquery>

            <cfif find_new_address_other.recordcount eq 1>

                <cfset new_address=find_new_address_other.new_address />
                <cfset new_address2=find_new_address_other.new_address2 />
                <cfset new_city=find_new_address_other.new_city />
                <cfset new_state=find_new_address_other.new_state />
                <cfset new_zip=find_new_address_other.new_zip />
                <cfset new_country=find_new_address_other.new_country />

            </cfif>

        </cfif>

        <cfquery name="find_new_tag" datasource="#dsn#" maxrows="3">
            SELECT valuetext as tag
            FROM contactitems
            WHERE valueCategory =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Tag" />
            and itemstatus =
            <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
            AND contactID =
            <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />
        </cfquery>

        <cfset i=0 />

        <cfloop query="find_new_tag">

            <cfoutput>

                <cfset i=#i# + 1 />

            </cfoutput>

            <cfif #i# is "1">

                <cfset new_Tag1=find_new_tag.tag />

            </cfif>

            <cfif #i# is "2">

                <cfset new_Tag2=find_new_tag.tag />

            </cfif>

            <cfif #i# is "3">

                <cfset new_Tag3=find_new_tag.tag />

            </cfif>

        </cfloop>

        <cfquery name="insert" datasource="#dsn#">
            INSERT INTO `exportitems` (
            `exportid`,
            `contactid`,
            `FirstName`,
            `LastName`,
            `Tag1`,
            `Tag2`,
            `Tag3`,

            `BusinessEmail`,
            `PersonalEmail`,
            `WorkPhone`,
            `MobilePhone`,
            `HomePhone`,
            `Company`,
            `Address`,
            `Address2`,
            `City`,
            `State`,
            `Zip`,
            `Country`,
            `ContactMeetingDate`,
            `ContactMeetingLoc`,
            `contactBirthday`,
            `Website`
            )

            VALUES (
            <cfqueryparam cfsqltype="cf_sql_integer" value="#new_exportid#" />,
            <cfqueryparam cfsqltype="cf_sql_integer" value="#new_contactid#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_FirstName#" maxlength="1000" null="#NOT len(trim(new_FirstName))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_LastName#" maxlength="1000" null="#NOT len(trim(new_LastName))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_Tag1#" maxlength="1000" null="#NOT len(trim(new_Tag1))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_Tag2#" maxlength="1000" null="#NOT len(trim(new_Tag2))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_Tag3#" maxlength="1000" null="#NOT len(trim(new_Tag3))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_BusinessEmail#" maxlength="1000" null="#NOT len(trim(new_BusinessEmail))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_PersonalEmail#" maxlength="1000" null="#NOT len(trim(new_PersonalEmail))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_WorkPhone#" maxlength="1000" null="#NOT len(trim(new_WorkPhone))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_MobilePhone#" maxlength="1000" null="#NOT len(trim(new_MobilePhone))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_HomePhone#" maxlength="1000" null="#NOT len(trim(new_HomePhone))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_Company#" maxlength="1000" null="#NOT len(trim(new_Company))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_Address#" maxlength="1000" null="#NOT len(trim(new_Address))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_Address2#" maxlength="1000" null="#NOT len(trim(new_Address2))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_City#" maxlength="1000" null="#NOT len(trim(new_City))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_State#" maxlength="1000" null="#NOT len(trim(new_State))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_Zip#" maxlength="1000" null="#NOT len(trim(new_Zip))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_Country#" maxlength="1000" null="#NOT len(trim(new_Country))#" />,
            <cfqueryparam cfsqltype="cf_sql_date" value="#new_ContactMeetingDate#" null="#NOT len(trim(new_ContactMeetingDate))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_ContactMeetingLoc#" maxlength="1000" null="#NOT len(trim(new_ContactMeetingLoc))#" />,
            <cfqueryparam cfsqltype="cf_sql_date" value="#new_contactbirthday#" null="#NOT len(trim(new_contactBirthday))#" />,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#new_Website#" maxlength="1000" null="#NOT len(trim(new_Website))#" />
            );
        </cfquery>

    </cfloop>
 
    <cfquery name="updateExport" datasource="#dsn#">
        update exports
        set exportstatus =
        <cfqueryparam cfsqltype="cf_sql_varchar" value="Active" />
        where exportid =
        <cfqueryparam cfsqltype="cf_sql_integer" value="#new_exportid#" />
    </cfquery>
        
 

    <cfquery name="export_ac" datasource="#dsn#">
        select contactid as ID,FirstName,lastname,Tag1,Tag2,Tag3,BusinessEmail,PersonalEmail,WorkPhone,MobilePhone,HomePhone,Company,Address,Address2,City,State,Zip,Country,ContactMeetingDate,ContactMeetingLoc,ContactBirthday,Website from exportitems
        where exportid =
        <cfqueryparam cfsqltype="cf_sql_integer" value="#new_exportid#" />
    </cfquery>

    <cfoutput>

        <cfset app_direct="C:\home\theactorsoffice.com\media-#host#\users\#session.userid#\" />
        <cfset sub_name_c="#dateformat('#now()#','YYYYMMDD')#" />
        <cfset sub_name_d="#timeformat('#now()#','HHMMSS')#" />
        <cfset fileName="export#sub_name_c##sub_name_d#.xls" />
        
        <cfscript>
            cfspreadsheet( action="write", fileName="#app_direct#\#fileName#", query="export_ac", overwrite=true );
        </cfscript>
        
        


        <cfheader name="content-disposition" value="Attachment;filename=#fileName#">
            <cfcontent file="#app_direct#\#fileName#" type="application/vnd.ms-excel">

    </cfoutput>
