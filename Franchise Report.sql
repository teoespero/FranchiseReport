 SELECT 
	SUM("UB_History"."s_amt_1") AS WATER,
	SUM("UB_History"."s_amt_2") AS SEWER,
	SUM("UB_History"."s_amt_3") AS BACKFLOW,
	SUM("UB_History"."s_amt_4") AS FIRE,
	SUM("UB_History"."s_amt_5") AS RECYCLED,
	SUM("UB_History"."s_amt_6") AS PENALTY,
	SUM("UB_History"."s_amt_7") AS TAX
	--"UB_History"."cust_no", 
	--"UB_History"."amount", 
	--"UB_History"."transaction_id", 
	--"UB_History"."tran_type", 
	--"UB_History"."s_amt_1", 
	--"UB_History"."s_amt_2", 
	--"UB_History"."s_amt_3", 
	--"UB_History"."s_amt_4", 
	--"UB_History"."s_amt_5", 
	--"UB_History"."s_amt_6", 
	--"UB_History"."s_amt_7", 
	--"UB_History"."s_amt_8", 
	--"Lot"."misc_1", 
	--"UB_Master"."billing_cycle", 
	--"UB_History"."tran_date"
 FROM   ("Springbrook0"."dbo"."ub_history" "UB_History" 
 INNER JOIN 
	"Springbrook0"."dbo"."ub_master" "UB_Master" 
	ON ("UB_History"."cust_no"="UB_Master"."cust_no") 
	AND ("UB_History"."cust_sequence"="UB_Master"."cust_sequence")) 
INNER JOIN 
	"Springbrook0"."dbo"."lot" "Lot" 
	ON "UB_Master"."lot_no"="Lot"."lot_no"
 WHERE  
	"UB_History"."tran_type"=N'Payment' 
	AND ("UB_History"."tran_date">={ts '2019-04-01 00:00:00'} 
	AND "UB_History"."tran_date"<{ts '2019-07-01 00:00:00'})
	-- AND "UB_History"."transaction_id" = 5974565




