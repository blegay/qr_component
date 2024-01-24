//%attributes = {"shared":false,"invisible":true}

var $logoFile : 4D:C1709.File
$logoFile:=File:C1566("/RESOURCES/sampleLogoSVGb64.txt")

var $text : Text
$text:="https://discuss.4d.com/t/create-qrcode-for-printing/29988/2"

var $logo : Text
$logo:=$logoFile.getText()

var $picture : Picture
$picture:=cs:C1710.qrCodeStyling.new($text; $logo).generate()

SET PICTURE TO PASTEBOARD:C521($picture)

var $qrCode : Object
$qrCode:=qr_qrCodeStylingNew($text; $logo)
$picture:=$qrCode.generate()
SET PICTURE TO PASTEBOARD:C521($picture)