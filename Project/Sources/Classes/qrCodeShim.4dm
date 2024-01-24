
// Class qrCodeShim
// This Class will generate a QR Code using a javascript library 

// https://github.com/davidshimjs/qrcodejs

// https://discuss.4d.com/t/qr-code-tn-generating-qr-codes-in-4d/28272/8

// var $qrcode : cs.qrCodeShim
// $qrcode:=cs.qrCodeShim.new("Hello")
// var $picture : Picture
// $picture:=$qrcode.generate()

// var $picture : Picture
// $picture:=cs.qrCodeShim.new("Hello").generate()

// $text : e.g. "https://discuss.4d.com/t/qr-code-tn-generating-qr-codes-in-4d/28272/6"

Class constructor($text : Text; $options : Object)
	
	If (Asserted:C1132(Count parameters:C259>0))
		This:C1470.text:=$text
		
		//options
		If (Count parameters:C259>1)
			This:C1470.options:=$options
		End if 
		
	Else 
		This:C1470.text:=""
	End if 
	
	If (This:C1470.options=Null:C1517)
		This:C1470.options:=New object:C1471
		This:C1470.options.width:=200
		This:C1470.options.height:=200
		This:C1470.options.colorDark:="#000000"  //black
		This:C1470.options.colorLight:="#ffffff"  //White
	End if 
	
Function onEvent
	Case of 
		: (FORM Event:C1606.code=On End URL Loading:K2:47)
			
			var $pictureBase64 : Text
			WA EXECUTE JAVASCRIPT FUNCTION:C1043(*; This:C1470.area; "getQRPicture"; $pictureBase64; This:C1470.text; This:C1470.options)
			
			This:C1470.result:=$pictureBase64
	End case 
	
	
Function generate()->$qrCodePicture : Picture
	
	var $templateFile : 4D:C1709.File
	$templateFile:=File:C1566("/RESOURCES/davidshimjs-qrcodejs/qrcode.html")
	
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
	