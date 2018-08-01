CREATE OR REPLACE PROCEDURE dbo.sp_thresholdaction
@dbname varchar(30),
@segmentname varchar(30),
@space_left int,
@status int
as

declare @mail_text varchar(1024)

select @mail_text = "/opt/sap/cron_scripts/pageNow.pl "+@dbname+" "+@segmentname+ 
 " "+convert(varchar,@space_left)

execute ("xp_cmdshell '"+@mail_text+"'")

if(@dbname = "tempdb")
dump transaction @dbname with truncate_only                                                                                                             
