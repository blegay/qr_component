//%attributes = {"invisible":false,"shared":true}
//================================================================================
//@xdoc-start : en
//@name : qr_qrCodeShimNew 
//@scope : public 
//@deprecated : no
//@description : This function returns a cs.qrCodeShim class instance
//@parameter[0-OUT-qrCodeShim-OBJECT] : cs.qrCodeShim class instance
//@parameter[1-IN-text-TEXT] : text
//@notes : 
//@example : 
//
//    // Before 4D v19R5
//
//  var $vt_text : Text
//  $vt_text:="Hello"
//
//  var $qrCode : Object
//  $qrCode:=qr_qrCodeShimNew($vt_text) 
//  var $picture : Picture
//  $picture:=$qrCode.generate()
//
//    // in 4D v19R5+
//
//  var $vt_text : Text
//  $vt_text:="Hello"

//  var $qrCode : cs.qrcode.qrCodeShim
//  $qrCode:=cs.qrcode.qrCodeShim.new($vt_text)
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

ASSERT:C1129(Count parameters:C259>0; "requires 1 parameter")

C_LONGINT:C283($vl_nbParam)
$vl_nbParam:=Count parameters:C259

If ($vl_nbParam>0)
	$vt_text:=$1
	
	$vo_qrCodeClass:=cs:C1710.qrCodeShim.new($vt_text)
	
Else 
	$vo_qrCodeClass:=cs:C1710.qrCodeShim.new()
End if 

$0:=$vo_qrCodeClass