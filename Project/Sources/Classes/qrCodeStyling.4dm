
// Class qrCodeStyling
// This Class will generate a QR Code using a javascript library 

// https://github.com/kozakdenys/qr-code-styling

// https://discuss.4d.com/t/qr-code-tn-generating-qr-codes-in-4d/28272/8

// var $qrcode : cs.qrCodeStyling
// $qrcode:=cs.qrCodeStyling.new("Hello"; "")
// var $picture : Picture
// $picture:=$qrcode.generate()

// var $picture : Picture
// $picture:=cs.qrCodeStyling.new("Hello"; "").generate()

// $data : e.g. "https://discuss.4d.com/t/qr-code-tn-generating-qr-codes-in-4d/28272/6"
// $qrCodePicture : e.g. "data:image/svg+xml;base64,PD94b...z4K"

Class constructor($data : Text; $qrCodePicture : Text)
	
	// for qrcode library
	This:C1470.width:=300
	This:C1470.height:=300
	This:C1470.type:="canvas"
	
	If (Count parameters:C259>0)
		This:C1470.data:=$data
	Else 
		This:C1470.data:=""
	End if 
	
	If (Count parameters:C259>1)
		This:C1470.image:=$qrCodePicture
	Else 
		This:C1470.image:=""
	End if 
	
	This:C1470.dotsOptions:=New object:C1471
	This:C1470.dotsOptions.color:="#4267b2"
	This:C1470.dotsOptions.type:="rounded"
	This:C1470.backgroundOptions:=New object:C1471
	This:C1470.backgroundOptions.color:="#e9ebee"
	This:C1470.imageOptions:=New object:C1471
	This:C1470.imageOptions.margin:=5
	
Function onEvent
	Case of 
		: (FORM Event:C1606.code=On End URL Loading:K2:47)
			
			var $pictureBase64 : Text
			WA EXECUTE JAVASCRIPT FUNCTION:C1043(*; This:C1470.area; "getQRPicture"; $pictureBase64; This:C1470)
			This:C1470.result:=$pictureBase64
			
	End case 
	
Function generate()->$qrCodePicture : Picture
	
	var $templateFile : 4D:C1709.File
	$templateFile:=File:C1566("/RESOURCES/qr-code-styling/template.html")
	
	If (Asserted:C1132($templateFile.exists))
		This:C1470.url:=$templateFile
		
		var $result : Text
		$result:=WA Run offscreen area:C1727(This:C1470)
		
		// clear offscreen properties
		This:C1470.url:=Null:C1517
		This:C1470.area:=Null:C1517
		
		var $headerLength : Integer
		$headerLength:=Length:C16("data:image/png;base64,")
		
		If (Length:C16($result)>$headerLength)
			var $pictureBase64 : Text
			$pictureBase64:=Delete string:C232($result; 1; $headerLength)
			
			var $pictureBlob : Blob
			BASE64 DECODE:C896($pictureBase64; $pictureBlob)  // do NOT use Base64URL decode
			
			BLOB TO PICTURE:C682($pictureBlob; $qrCodePicture)
		End if 
	End if 
	
	