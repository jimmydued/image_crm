<?php
require_once 'include/CommonFunctions.php';
        
class aCart_Functions extends Common_Functions{
 
    // constructor
    function __construct($input_data) {
		parent::__construct();
        $this->keepValidateUser($input_data);
    }	
	/**
		 * Get Cart Data
	 */
	function getCartData() { 
	 
			$where="";
			
			
			if(!empty($this->input_data->country)){
				
				$where.=" AND country LIKE '%$this->input_data->country%' ";
				
			}
			if(!empty($this->input_data->status)){
				
				$where.=" AND status='$this->input_data->status' ";
				
			}
			
			if(!empty($this->input_data->created_date)){
				
				$where.=" AND DATE(created) = '$this->input_data->created_date' ";
				
			}
			
			
			
			$stmt = $this->conn->prepare("SELECT * from products WHERE 1=1 $where");
	            
			if ($stmt->execute()) {
				$result = $stmt->get_result()->fetch_assoc();
				$stmt->close();
				return $result;
				
			} else {
				return NULL;
			}
	}
} 

$tf = new aCart_Functions($data);


if($task=="list"){
	$result_data=$tf->getCartData();
	$response["error"] = FALSE;
	$response["error_msg"] = "";
	$response["data"] = $result_data;
	echo json_encode($response);
}
?>