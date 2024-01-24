//%attributes = {"shared":false,"invisible":true}

var $text : Text
$text:="https://discuss.4d.com/t/create-qrcode-for-printing/29988/2"

var $picture : Picture
$picture:=cs:C1710.qrCodeShim.new($text).generate()

SET PICTURE TO PASTEBOARD:C521($picture)


var $qrCode : Object
$qrCode:=qr_qrCodeShimNew($text)
$picture:=$qrCode.generate()
SET PICTURE TO PASTEBOARD:C521($picture)
