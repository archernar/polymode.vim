# CUU Repo - A set of AWS CLI Wrappers and Utility Scripts
Script | Description | Usage | Defaults
------ | ----------- | ----- | --------
cuu | A multi function AWS CLI Wrapper Utility | See below
ec2ls | A ec2 listing utility | ec2ls -a "\<profile list\>" -r "\<region list\>" | All US regions
ec2sg | A sg check utility | ec2sg -a "\<profile list\>" -r "\<region list\>" | EUROPE, US, GLOBAL, or specific region string
### Examples
<pre>
 cuu -a ENV1 -c USERLIST
 ec2ls -a "ENV1 EVN2"
</pre>
 
## CUU - An AWS CLI Wrapper
###### Setup:  CUUHOME enviroment variable should be set to the cuu install directory
<pre>
</pre>
### Commands  
<pre>
User Commands  
     usercreateadmin              -a -u -p     Create admin user
     usercreate                   -a -u -p -t  Create a user and assign access keys
     usercreatedefault            -a -u        Create a user with default settings
     usercreatenokey              -a -u -p     Create a user with no access keys
     usercreatereadonly           -a -u -p     Create readonly user
     userdelete                   -a -u        Delete user
     userdescribe                 -a -u        Lists groups and policies associated with user/userlist
     userls-2                     -a           User listing (simple format)
     userls                       -a           User listing
     userls-json                  -a           User list in json format
     usermenu                     -a           Menu driven user information
Password Commands  
     passwordchange               -a -u -p     Change a users password
     passwordchangehard           -a -u -p     Change a users password
     passwordfixed                -a -u -p     Change a users password (fixed)
     passwordscram                -a -u        Make a users password unkown (scram)
     passwordscramset             -a -u        Make fileset of user password unkown (scram)
  
AccessKey Commands  
     accesskeycreate              -a           Create access keys for user
     accesskeyreplace             -a           Delete and replace access keys
     accesskeysdelete             -a           Delete all access keys attached to user
     accesskeysls                 -a           List a users access keys
  
Policy Commands  
     policyattachtoallusers       -a -t        Attach policy to all users
     policyattachtouser           -a -u        Attach policy to user
     policybyarn-add              -a -u -t     Attach policy to user by ARN
     policybyarn-remove           -a -u -t     Detach policy from user by ARN
     policybyname-add             -a -t        Attach local policy to user by policy name
     policybyname-remove          -a -t        Detach local policy from user by policy name
     policycodecommitpoweruser-add -a           Add arn:aws:iam::aws:policy/AWSCodeCommitPowerUser to user
     policycodecommitpoweruser-remove -a           Remove arn:aws:iam::aws:policy/AWSCodeCommitPowerUser from user
     policycreate                 -a -t        Create policy bu name and upload policy document this.json
     policydelete                 -a -t        Delete local policy ARN
     policydetach                 -a -u -t     Detach policy from user
     policygetall                 -a           Get all policy documents
     policyget                    -a -t        Get policy
     policygetdocument            -a           Get policy document
     policygetlocal               -a           Get local policy documents
     policylistall                -a           List all policies
     policylistaws                -a           List all AWS policies
     policylistlocal              -a           List local policies
     policylistuser               -a -u        List policies atttached to user
     policyp1-add                 -a -u -t     Attach policy P1 to user
     policyp1-remove              -a -u -t     Remove policy P1 to user
     policyp2-add                 -a -u -t     Attach policy P2 to user
     policyp2-remove              -a -u -t     Remove policy P2 to user
     policyp3-add                 -a -u -t     Attach policy P3 to user
     policyp3-remove.p3r          -a -u -t     Remove policy P3 to user
     policyp4-add                 -a -u -t     Attach policy P4 to user
     policyp4-remove              -a -u -t     Remove policy P4 to user
     policyp5-add                 -a -u -t     Attach policy P5 to user
     policyp5-remove              -a -u -t     Remove policy P5 to user
     policysetattach              -a -u        Attach all policies specified in policyset.txt to user
     policysetremove              -a -u        Remove all policies specified in policyset.txt from user
     policyupdate                 -a -t -D     Update policy
     policyuserchangepassword-add -a           Add arn:aws:iam::aws:policy/IAMUserChangePassword to user
     policyuserchangepassword-remove -a           Remove arn:aws:iam::aws:policy/IAMUserChangePassword from user
     policyuserdetachall          -a -u        Detach all policies from user
  
Group Commands  
     groupadduser                 -a -t        Add user/userlist to group
     groupcreate                  -a -t        Create group in profile
     groupdelete                  -a -u -t     Delete group from profile by group name
     groupg1-add                  -a -t        Add usert to group G1
     groupg1-remove               -a -t        Remove user from group G1
     groupg2-add                  -a -t        Add usert to group G2
     groupg3-add                  -a -t        Add usert to group G3
     groupg4-add                  -a -t        Add usert to group G4
     groupg5-add                  -a -t        Add usert to group G5
     grouplistusers               -a           List users in group
     groupls                      -a           List groups in profile
     groupp2-remove               -a -t        Remove user from group G2
     groupp3-remove               -a -t        Remove user from group G3
     groupp4-remove               -a -t        Remove user from group G4
     groupp5-remove               -a -t        Remove user from group G5
     groupremoveallusers          -a           Remove all groups atttach to user
     groupremoveuser              -a           Remove user from group by group name
     groupsforuser                -a           List groups attached to user
  
Role Commands  
     rolels                       -a           List Roles
  
VPC Commands  
     vpccreate                    -a -r        Create a Two Subnet VPC
     vpcdelete                    -a -r -t     Delete VPC
     vpcinstance                  -a           Create an instance in the VPC
     vpcls                        -a           List VPCs
  
EC2 Commands  
     ec2ls2                       -a           List Instances 2
     ec2ls                        -a           EC2 List
     ec2myls                      -a           My EC2 List
     ec2sg                        -a           Security Group Detail Report
     ec2sgsum2                    -a           Security Group Summary Report
     ec2sgsum                     -a           Security Group Summary Report
     ec2spark                     -a -t        CloudWatch CPU Utilization with Spark Graphing
     ec2sparkmenu                 -a           Instance Menu
     ec2tags2222                  -a           EC2 Tags
     ec2tags                      -a           EC2 Tags
     ec2terminate                 -a           Terminate Instance
     ec2terminatelast             -a           Terminate Last Instance
     ec2-util                     -a           CloudWatch CPU Utilization
  
VOLUME Commands  
     volumesls                    -a           Volume List
     volumestorage                -a           Aggregate Volume Size
  
RDS Commands  
     rdslimits                    -a -u -p     List RDS Limits
     rdslist                      -a -r -t (grep) List RDS Instances
  
AMI Commands  
     amils                        -a           List Local AMIs
  
LAMBDA Commands  
     lambdals                     -a           List Lambda Functions
  
S3 Commands  
     s3clearbucket                -a -b -k     S3 Remove Object, with wildcard (%) keys
     s3copy-1minute               -a -b -d     S3 Copy, Expires in 1 Minute
     s3copy                       -a -b -d     S3 Copy, with wildcard (%) documents
     s3copywithrenaming           -a -b -d     S3 Copy and Rename, with wildcard (%) documents
     s3createbucket               -a -b        Create S3 Bucket
     s3createbucket-eucentral1    -a -b        Create S3 Bucket in eu-central-1
     s3createbucket-euwest1       -a -b        Create S3 Bucket in eu-west-1
     s3createbucket-useast1       -a -b        Create S3 Bucket in us-east-1
     s3createbucket-useast2       -a -b        Create S3 Bucket in us-east-2
     s3createbucket-uswest1       -a -b        Create S3 Bucket in us-west-1
     s3createbucket-uswest2       -a -b        Create S3 Bucket in us-west-2
     s3deletebucket               -a -b        Deletes a S3 Bucket
     s3html                       -a -b -C     S3 List as HTML Page
     s3ls                         -a           S3 List
     s3lsr                        -a           S3 Recursive List
     s3presign                    -a -b -k     Presign S3 URL
     s3publish                    -a           Publish Files
     s3publishclear               -a -b -k     Clear Publish Bucket
     s3publishmore                -a           Publish Files (without clearing bucket)
     s3put                        -a -b -k -d  S3 Put Object
     s3puthtml                    -a -b -k -d  S3 Put HTML Object
     s3putpdf                     -a -b -k -d  S3 Put PDF Object
     s3putpdffileset              -a -b        S3 Put PDF Fileset
     s3puttext                    -a -b -k -d  S3 Put Text Object
     s3remove                     -a -b -k     S3 Remove Object, with wildcard (%) keys
     s3rmfileset                  -a -b        S3 Remove Fileset
     s3url                        -a -b -k     Create a Signed URL
  
Vim Commands  
     vims3put                     -a -b -d     S3 Vim Put
  
  
CloudTrail Commands  
     cloudtrail-active            -a           Cloudtrail watch all activity in the time window
     cloudtrailbyuser-raw         -a           CloudTrail Raw By User
     cloudtrailmenu               -a           Menu interface to pick and watch users via cloudtrail
     cloudtrail-user              -a           Tracks a user's activity via cloud trail
     cloudtrail-watch             -a           Cloudtrail watch a user across multiple profiles
     cloudtrailworld              -a           CloudTrail report for 100 hour window for user across all regions
  
Utility Commands  
     utilaccountnumber            -a           Print account number
     utilcatpolicydoc             -a           Display policydoc.json template
     utilcommandls                -a           List Commands
     utilcommands                 -a           Command help
     utilconfig                   -a           Edit Configuration File ~/.cuu.txt
     utildumpconfig               -a           Dump Configuration File ~/.cuu.txt
     utilnewpolicydoc             -a           Create new this.json from policydoc.json template
     utiloginurl                  -a           Print console login URL
     utilpublish                  -a           Publish Files
     utilpublishcuureport         -a           Publish cuureport.txt
     utilpublishmore              -a           Publish Files (without clearing bucket)
     utilrepo                     -a           List the cuu repo url
     utilset                      -a           Set and Show configuration/environment variables
     utilswap                     -a           Swap a Policy for a Group
     utiltime                     -a           Print time window
</pre>
### Command Aliases
<pre>
ACCESSKEYCREATE                  CREATEACCESSKEY                                                           
ACCESSKEYREPLACE                 REPLACEACCESSKEYS                                                         
ACCESSKEYSDELETE                 ACCESSKEYCLEAR           DELETEACCESSKEYS                                 
ACCESSKEYSLS                     ACCESSKEYLIST            LISTACCESSKEY                                    
AMILS                                                                                                      
CL                                                                                                         
CLOUDTRAIL-ACTIVE                                                                                          
CLOUDTRAIL-USER                  CU                                                                        
CLOUDTRAIL-WATCH                                                                                           
CLOUDTRAILBYUSER-RAW             CTRU                                                                      
CLOUDTRAILMENU                                                                                             
CLOUDTRAILWORLD                  WORLD                                                                     
CONSOLEOPEN                                                                                                
DDBCREATENAMEVALUETABLE                                                                                    
DDBCREATETABLE                                                                                             
DDBDELETETABLE                                                                                             
DDBGETNAMEVALUE                                                                                            
DDBLIST                                                                                                    
DDBPUTNAMEVALUE                                                                                            
DDBQUERYNAMEVALUE                                                                                          
EC2-UTIL                                                                                                   
EC2LS                            EC2LIST                                                                   
EC2LS2                           EC2LIST2                                                                  
EC2MYLS                          EC2LSMY                                                                   
EC2SG                                                                                                      
EC2SGSUM                                                                                                   
EC2SGSUM2                                                                                                  
EC2SPARK                                                                                                   
EC2SPARKMENU                                                                                               
EC2TAGS                                                                                                    
EC2TAGS2222                                                                                                
EC2TERMINATE                                                                                               
EC2TERMINATELAST                                                                                           
GAPP                                                                                                       
GROUPADDUSER                     GROUPADD                                                                  
GROUPCREATE                                                                                                
GROUPDELETE                                                                                                
GROUPG1-ADD                                                                                                
GROUPG1-REMOVE                                                                                             
GROUPG2-ADD                                                                                                
GROUPG3-ADD                                                                                                
GROUPG4-ADD                                                                                                
GROUPG5-ADD                                                                                                
GROUPLISTUSERS                   LISTUSERSINGROUP                                                          
GROUPLS                          GROUPLIST                LISTGROUPS                                       
GROUPP2-REMOVE                                                                                             
GROUPP3-REMOVE                                                                                             
GROUPP4-REMOVE                                                                                             
GROUPP5-REMOVE                                                                                             
GROUPREMOVEALLUSERS                                                                                        
GROUPREMOVEUSER                                                                                            
GROUPSFORUSER                    LISTUSERGROUPS                                                            
KEYPAIRCREATE                    CREATEKEYPAIR                                                             
LAMBDALS                         LAMBDATLIST                                                               
LOGINPROFILECREATE                                                                                         
PASSWORDCHANGE                   CHANGEPASSWORD                                                            
PASSWORDCHANGEHARD               CHANGEPASSWORDHARD                                                        
PASSWORDFIXED                    FIXED                                                                     
PASSWORDSCRAM                    SCRAMPASSWORD                                                             
PASSWORDSCRAMSET                 SCRAMPASSWORDSET                                                          
POLICYATTACHTOALLUSERS           ATTACHPOLICYTOALLUSERS                                                    
POLICYATTACHTOUSER               ATTACHPOLICYTOUSER                                                        
POLICYBYARN-ADD                                                                                            
POLICYBYARN-REMOVE                                                                                         
POLICYBYNAME-ADD                                                                                           
POLICYBYNAME-REMOVE                                                                                        
POLICYCODECOMMITPOWERUSER-ADD    IAMUSERCODECOMMITPOWERUSER-ADD                                                  
POLICYCODECOMMITPOWERUSER-REMOVE IAMUSERCODECOMMITPOWERUSER-REMOVE                                                  
POLICYCREATE                                                                                               
POLICYDELETE                                                                                               
POLICYDETACH                                                                                               
POLICYGET                        GETPOLICY                                                                 
POLICYGETALL                     GETALLPOLICIES           GAP                                              
POLICYGETDOCUMENT                                                                                          
POLICYGETLOCAL                   GETLOCALPOLICIES         GLP                                              
POLICYLISTALL                    LISTALLPOLICIES                                                           
POLICYLISTAWS                    LISTAWSPOLICIES                                                           
POLICYLISTLOCAL                  LISTLOCALPOLICIES                                                         
POLICYLISTUSER                   LISTUSERPOLICIES                                                          
POLICYP1-ADD                     P1A                                                                       
POLICYP1-REMOVE                  P1R                                                                       
POLICYP2-ADD                     P2A                                                                       
POLICYP2-REMOVE                  P2R                                                                       
POLICYP3-ADD                     P3A                                                                       
POLICYP3-REMOVE.P3R                                                                                        
POLICYP4-ADD                     P4A                                                                       
POLICYP4-REMOVE                  P4R                                                                       
POLICYP5-ADD                     P5A                                                                       
POLICYP5-REMOVE                  P5R                                                                       
POLICYSETATTACH                  ATTACHPOLICYSET                                                           
POLICYSETREMOVE                  REMOVEPOLICYSET                                                           
POLICYUPDATE                     UPDATEPOLICY                                                              
POLICYUSERCHANGEPASSWORD-ADD     IAMUSERCHANGEPASSWORD-ADD                                                  
POLICYUSERCHANGEPASSWORD-REMOVE  IAMUSERCHANGEPASSWORD-REMOVE                                                  
POLICYUSERDETACHALL              DETACHUSERPOLICIES                                                        
RDSLIMITS                                                                                                  
RDSLIST                          RDSLS                                                                     
ROLELS                           ROLESLIST                LISTROLES                                        
S3CLEARBUCKET                    S3CLEAR                                                                   
S3COPY                                                                                                     
S3COPY-1MINUTE                                                                                             
S3COPYWITHRENAMING                                                                                         
S3CREATEBUCKET                                                                                             
S3CREATEBUCKET-EUCENTRAL1                                                                                  
S3CREATEBUCKET-EUWEST1                                                                                     
S3CREATEBUCKET-USEAST1                                                                                     
S3CREATEBUCKET-USEAST2                                                                                     
S3CREATEBUCKET-USWEST1                                                                                     
S3CREATEBUCKET-USWEST2                                                                                     
S3DELETEBUCKET                                                                                             
S3HTML                                                                                                     
S3LS                             S3LIST                   LB                                               
S3LSR                            S3LISTRECURSIVE          LBR                                              
S3PRESIGN                                                                                                  
S3PUBLISHCLEAR                   PUBLISHCLEAR                                                              
S3PUT                                                                                                      
S3PUTHTML                                                                                                  
S3PUTPDF                                                                                                   
S3PUTPDFFILESET                                                                                            
S3PUTTEXT                                                                                                  
S3REMOVE                         S3RM                                                                      
S3RMFILESET                                                                                                
S3URL                                                                                                      
TAGG                                                                                                       
TAGSLS                           TAGSLIST                                                                  
USERCREATE                       CREATEUSER                                                                
USERCREATEADMIN                  CREATEREADMINUSER                                                         
USERCREATEDEFAULT                CREATEDEFAULTUSER                                                         
USERCREATENOKEY                  CREATEUSERNOKEY                                                           
USERCREATEREADONLY               CREATEREADONLYUSER                                                        
USERDELETE                       DELETEUSER                                                                
USERDESCRIBE                     DESCRIBEUSERS            DU                                               
USERLS                           USERLIST                 LISTUSERS                LU                      
USERLS-2                         USERLIST-2               LISTUSERS2                                       
USERLS-JSON                      USERLIST-JSON            LISTUSERS-JSON                                   
USERMENU                                                                                                   
UTILACCOUNTNUMBER                ACCOUNTNUMBER                                                             
UTILALIAS                        ALIAS                                                                     
UTILALIASLS                      ALIASLIST                                                                 
UTILCATPOLICYDOC                 CATPOLICYDOC             SHOWPOLICYDOC                                    
UTILCONFIG                       CONFIG                                                                    
UTILDUMPCONFIG                   DUMPCONFIG               DUMP                                             
UTILNEWPOLICYDOC                 NEWPOLICYDOC                                                              
UTILOGINURL                      LOGINURL                 LOGIN                                            
UTILPUBLISH                      PUBLISH                  S3PUBLISH                                        
UTILPUBLISHCUUREPORT             PUBLISHCUUREPORT                                                          
UTILPUBLISHMORE                  PUBLISHMORE              S3PUBLISHMORE                                    
UTILREPO                         REPO                                                                      
UTILSWAP                                                                                                   
UTILTIME                         TIME                                                                      
VIMS3PUT                         S3VIMPUT                                                                  
VOLUMESLS                        VOLUMELS                                                                  
VOLLS                                                                                                      
VOLUMESTORAGE                                                                                              
VPCCREATE                        CREATEVPC-2SUBNETS                                                        
VPCDELETE                        DELETEVPC                                                                 
VPCINSTANCE                                                                                                
VPCLS                                                                                                      
WWEC2                                                                                                      
</pre>
### ~/.cuu.txt can contain defaults for these settings
<pre>
</pre>
### Build Date
<pre>
Tue Aug 21 05:48:45 EDT 2018
</pre>
