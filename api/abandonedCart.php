<?php
require_once 'include/CommonFunctions.php';
        
class aCart_Functions extends Common_Functions{
 
    // constructor
    function __construct($input_data) {
		parent::__construct();
        $this->keepValidateUser($input_data);
    }	
	/**
		 * Get abandoned cart data
	 */
	function getCartData() { 	 	
	 	$stmt = $this->conn->prepare("SELECT id,name,keywords,price,img_sizes,active,product_video,DATE_FORMAT(created,'%Y/%m/%d') as created from products");	        
		if ($stmt->execute()) {				
			$result = $this->fetchArray($stmt);
			return $result;				
		}
		else
		{
			return NULL;
		}
	}		
} 

$tf = new aCart_Functions($data);

if($task=="list"){
	$result_data			=	$tf->getCartData();
	$countries_Data			=	$tf->getCountriesData();
	$response["error"] 		= 	FALSE;
	$response["error_msg"] 	= 	"";
	$response["data"] 		= 	$result_data;
	$response["countries"] 	= 	$countries_Data;
	echo json_encode($response);
}
?>