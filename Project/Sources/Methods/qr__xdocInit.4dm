//%attributes = {"shared":false,"invisible":true}
//================================================================================
//@xdoc-start : en
//@name : qr__xdocInit
//@scope : public
//@deprecated : no
//@description : This function initialize the XDOC component
//@notes :
//@example : qr__xdocInit
//@see :
//@version : 1.00.00
//@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2024
//@history : CREATION : Bruno LEGAY (BLE) - 24/01/2024, 09:17:12 - v1.00.00
//@xdoc-end
//================================================================================

C_TEXT:C284($vt_prefixPattern; $vt_version)
$vt_prefixPattern:="qr"
$vt_version:=qr_componentVersionGet

If (Not:C34(Is compiled mode:C492))
	
	ARRAY TEXT:C222($tt_components; 0)
	COMPONENT LIST:C1001($tt_components)
	
	If (Find in array:C230($tt_components; "XDOC_component")>0)
		
		C_TEXT:C284($vt_compte; $vt_developer)
		$vt_compte:=Current system user:C484
		Case of 
			: ($vt_compte="@Bruno@")
				$vt_developer:="Bruno LEGAY (BLE)"
				
			: ($vt_compte="@Joel@")
				$vt_developer:="Joël LACLAVERE (JLA)"
				
			: ($vt_compte="@Jean@")
				$vt_developer:="Jean GRAVELINE (JGR)"
				
			Else 
				$vt_developer:="Bruno LEGAY (BLE)"
		End case 
		
		EXECUTE METHOD:C1007("XDOC_componentPrefixSet"; *; $vt_prefixPattern)
		
		EXECUTE METHOD:C1007("XDOC_authorSet"; *; 1; $vt_developer)
		
		EXECUTE METHOD:C1007("XDOC_authorSet"; *; 2; $vt_developer+" - Copyrights A&C Consulting "+String:C10(Year of:C25(Current date:C33)))
		
		EXECUTE METHOD:C1007("XDOC_versionTagSet"; *; $vt_version)
		
		C_LONGINT:C283($vl_userParamLong)
		C_TEXT:C284($vt_userParamText)
		$vl_userParamLong:=Get database parameter:C643(User param value:K37:94; $vt_userParamText)  // 108
		Case of 
			: ($vt_userParamText="build")
				
				EXECUTE METHOD:C1007("XDOC_build"; *)
				
				QUIT 4D:C291
		End case 
		
	End if 
	
	ARRAY TEXT:C222($tt_components; 0)
End if 