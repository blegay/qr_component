C_LONGINT:C283($1; $vl_dbEvent)
$vl_dbEvent:=$1

Case of 
	: ($vl_dbEvent=On before host database startup:K74:3)
		// put code here that you want to execute before the "On Startup" database method
		// of the host database
		qr__initStorage
		
	: ($vl_dbEvent=On after host database startup:K74:4)
		// put code here that you want to execute after the "On Startup"
		// database method of the host database
		qr__init
		
	: ($vl_dbEvent=On before host database exit:K74:5)
		// put code here that you want to execute before the "On Exit"
		// database method of the host database
		
		
	: ($vl_dbEvent=On after host database exit:K74:6)
		// put code here that you want to execute after the "On Exit"
		// database method of the host database
		
End case 
