declare @ItemID as int 
declare @CurrentValue as int
declare @NewValue as char(2)

set @ItemID = 1001				-- the ItemID from the table: dbo.Items in the Database: PS_GameDefs
set @CurrentValue = 30			-- Orangestats equal to this number or higher will be changed to the new number below
set @NewValue = '35'			-- New value - Remember number format must be entered like this: '35' to indicate data type

select @ItemID as 'ItemID_ChangedItem', @CurrentValue as 'CurrentOrangeValue', @NewValue as 'NewOrangeValue', ItemName as 'ItemChanged' from [PS_GameDefs].[dbo].[Items] where ItemID = @ItemID


/* Changes Char Items */
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].[dbo].[CharItems] a
where LEN(Craftname) >= 20
	and ItemID = @ItemID

/* Changes Guild Items */
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].[dbo].[GuildStoredItems] a
where LEN(Craftname) >= 20
	and ItemID = @ItemID

/* Changes Warehouse Items */
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].[dbo].[UserStoredItems] a
where LEN(Craftname) >= 20
	and ItemID = @ItemID


/* Changes Warehouse Items */
/*
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].dbo.MarketCharResultMoney a
where LEN(Craftname) >= 20
	and ItemID = @ItemID
*/

/* Changes Warehouse Items */
/*
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].[dbo].MarketCharResultMoney_DelLog a
where LEN(Craftname) >= 20
	and ItemID = @ItemID
*/


/* Changes Warehouse Items */
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].[dbo].MarketItems a
where LEN(Craftname) >= 20
	and ItemID = @ItemID



/* Changes Warehouse Items */
update a
set CraftName =		case when cast(SUBSTRING(Craftname,1,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,1,2) end +
					case when cast(SUBSTRING(Craftname,3,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,3,2) end +
					case when cast(SUBSTRING(Craftname,5,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,5,2) end +
					case when cast(SUBSTRING(Craftname,7,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,7,2) end +
					case when cast(SUBSTRING(Craftname,9,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,9,2) end +
					case when cast(SUBSTRING(Craftname,11,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,11,2) end +
					case when cast(SUBSTRING(Craftname,13,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,13,2) end +
					case when cast(SUBSTRING(Craftname,15,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,15,2) end +
					case when cast(SUBSTRING(Craftname,17,2) as int) >= @CurrentValue then ltrim(@NewValue) else SUBSTRING(Craftname,17,2) end +
					SUBSTRING(Craftname,19,2) 
FROM [PS_GameData].dbo.MarketItems_DelLog a
where LEN(Craftname) >= 20
	and ItemID = @ItemID


