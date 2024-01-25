# qr_component

This component uses Javascript libraries and Offscreen web areas to generate QR Codes.

This component works with 4D v19+ (requires Offscreen web areas).

Two libraries are used (and packaged in the component)

  https://github.com/davidshimjs/qrcodejs


```4d
   // Before 4D v19R5
var $vt_text : Text
$vt_text:="Hello"

var $qrCode : Object
$qrCode:=qr_qrCodeShimNew($vt_text) 
var $picture : Picture
$picture:=$qrCode.generate()

  // in 4D v19R5+
var $vt_text : Text
$vt_text:="Hello"

var $qrCode : cs.qrcode.qrCodeShim
$qrCode:=cs.qrcode.qrCodeShim.new($vt_text)
var $picture : Picture
$picture:=$qrCode.generate()
```

  https://github.com/kozakdenys/qr-code-styling

```4d
   // Before 4D v19R5
var $vt_text; $vt_logo : Text
$vt_text:="Hello"
$vt_logo:="" // e.g. "data:image/svg+xml;base64,PD94b...z4K"

var $qrCode : Object
$qrCode:=qr_qrCodeStylingNew($vt_text;$vt_logo) 
var $picture : Picture
$picture:=$qrCode.generate()

  // in 4D v19R5+
var $vt_text; $vt_logo : Text
$vt_text:="Hello"
$vt_logo:="" // e.g. "data:image/svg+xml;base64,PD94b...z4K"

var $qrCode : cs.qrcode.qrCodeStyling
$qrCode:=cs.qrcode.qrCodeStyling.new($vt_text;$vt_logo)
var $picture : Picture
$picture:=$qrCode.generate()
```
