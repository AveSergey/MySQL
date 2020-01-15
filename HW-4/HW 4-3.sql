UPDATE profiles
	SET is_active=true
	where date_sub(current_date, interval 18 year) > birthday
	;