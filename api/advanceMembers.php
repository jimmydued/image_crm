<?php
require_once 'include/CommonFunctions.php';
        
class Users_Functions extends Common_Functions{
 
    // constructor
    function __construct($input_data) {
		parent::__construct();
        $this->keepValidateUser($input_data);
    }	
	/**
		 * Get transactions
	 */
	function getUsers() { 
	 
			$where="";
			if(!empty($this->input_data->name)){
				
				$where.=" AND (firstname LIKE '%$this->input_data->name%' OR lastname LIKE '%$this->input_data->name%' OR  email LIKE '%$this->input_data->name%' ) ";
				
			}
			
			if(!empty($this->input_data->name)){
				
				$where.=" AND (firstname LIKE '%$this->input_data->name%' OR lastname LIKE '%$this->input_data->name%' ) ";
				
			}
			
			if(!empty($this->input_data->city)){
				
				$where.=" AND city LIKE '%$this->input_data->city%' ";
				
			}
			
			if(!empty($this->input_data->state)){
				
				$where.=" AND state LIKE '%$this->input_data->state%' ";
				
			}
			
			if(!empty($this->input_data->country)){
				
				$where.=" AND country LIKE '%$this->input_data->country%' ";
				
			}
			if(!empty($this->input_data->postcode)){
				
				$where.=" AND postcode LIKE '%$this->input_data->postcode%' ";
				
			}
			if(!empty($this->input_data->company)){
				
				$where.=" AND company LIKE '%$this->input_data->company%' ";
				
			}
			if(!empty($this->input_data->created_date)){
				
				$where.=" AND DATE(created) = '$this->input_data->created_date' ";
				
			}
			if(!empty($this->input_data->phone)){
				
				$where.=" AND (phone LIKE '%$this->input_data->phone%' OR mobile LIKE '%$this->input_data->mobile%' ) ";
				
			}
			
			
			$stmt = $this->conn->prepare("SELECT * from users WHERE 1=1 $where");
	            
			if ($stmt->execute()) {
				$result = $stmt->get_result()->fetch_assoc();
				$stmt->close();
				return $result;
				
			} else {
				return NULL;
			}
	}
} 

$tf = new Users_Functions($data);


if($task=="list"){
	$result_data=$tf->getUsers();
	$response["error"] = FALSE;
	$response["error_msg"] = "";
	$response["data"] = $result_data;
	echo json_encode($response);
}
?>