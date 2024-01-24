//%attributes = {"shared":false,"invisible":true}

C_BOOLEAN:C305($vb_init)

$vb_init:=Bool:C1537(Storage:C1525.qr.init)

If (Not:C34($vb_init))
	
	Use (Storage:C1525.qr)
		Storage:C1525.qr.init:=True:C214
	End use 
	
	qr__moduleDebugDateTimeLine(4; Current method name:C684; "qr_component v"+qr_componentVersionGet+" inited.")
End if 
