declare @opt int  = 0
declare @now datetime = getutcdate()
declare @foo table (val int, result nvarchar(500))

while @opt < 512
begin
	begin try
		insert into @foo select @opt, CONVERT(nvarchar, @now, @opt)
	end try
	begin catch
	end catch

	set @opt = @opt + 1
end

select * from @foo