UPDATE [PS_UserData].[dbo].[Users_Master]
SET LeaveDate=GETDATE()
WHERE UseQueue= 'False'

UPDATE [PS_UserData].[dbo].[Users_Master]
SET Leave=0