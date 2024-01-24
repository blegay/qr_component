//%attributes = {"shared":true,"invisible":false}
//================================================================================
//@xdoc-start : en
//@name : qr_qrCodeStylingNew 
//@scope : public 
//@deprecated : no
//@description : This function returns a cs.qrCodeStyling class instance
//@parameter[0-OUT-qrCodeStyling-OBJECT] : cs.qrCodeStyling class instance
//@parameter[1-IN-text-TEXT] : text
//@parameter[2-IN-picture-TEXT] : picture in url format (e.g. : "data:image/svg+xml;base64,PD94b...z4K")
//@notes : 
//@example : 
//
//    // Before 4D v19R5
//
//  var $vt_text; $vt_logo : Text
//  $vt_text:="Hello"
//  $vt_logo:="" // e.g. "data:image/svg+xml;base64,PD94b...z4K"
//
//  var $qrCode : Object
//  $qrCode:=qr_qrCodeStylingNew($vt_text;$vt_logo) 
//  var $picture : Picture
//  $picture:=$qrCode.generate()
//
//    // in 4D v19R5+
//
//  var $vt_text; $vt_logo : Text
//  $vt_text:="Hello"
//  $vt_logo:="" // e.g. "data:image/svg+xml;base64,PD94b...z4K"
//
//  var $qrCode : cs.qrcode.qrCodeStyling
//  $qrCode:=cs.qrcode.qrCodeStyling.new($vt_text;$vt_logo)
//  var $picture : Picture
//  $picture:=$qrCode.generate()
//
//@see : 
//@version : 1.00.00
//@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting 2024
//@history : 
//  CREATION : Bruno LEGAY (BLE) - 24/01/2024, 23:39:06 - v4.00.00
//@xdoc-end
//================================================================================

C_OBJECT:C1216($0; $vo_qrCodeClass)
C_TEXT:C284($1; $vt_text)
C_TEXT:C284($2; $vt_logo)

ASSERT:C1129(Count parameters:C259>0; "requires 1 parameter")

C_LONGINT:C283($vl_nbParam)
$vl_nbParam:=Count parameters:C259

Case of 
	: ($vl_nbParam>1)
		$vt_text:=$1
		$vt_logo:=$2
		
		$vo_qrCodeClass:=cs:C1710.qrCodeStyling.new($vt_text; $vt_logo)
		
	: ($vl_nbParam>0)
		$vt_text:=$1
		
		$vo_qrCodeClass:=cs:C1710.qrCodeStyling.new($vt_text)
		
	: ($vl_nbParam=0)
		$vo_qrCodeClass:=cs:C1710.qrCodeStyling.new()
		
End case 
$0:=$vo_qrCodeClass