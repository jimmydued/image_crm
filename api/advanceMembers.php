<?php
require_once 'include/CommonFunctions.php';
        
class Users_Functions extends Common_Functions{
 
    // constructor
    function __construct($input_data){
		parent::__construct();
        $this->keepValidateUser($input_data);
    }	
	/**
		* Get transactions
	*/
	function getUsers($input_data) { 
			
			$where="";
			if(!empty($input_data->name)){				
				$where.=" AND (firstname LIKE '%$input_data->name%' OR lastname LIKE '%$input_data->name%' OR  email LIKE '%$input_data->name%' ) ";				
			}
			
			if(!empty($input_data->city)){
				
				$where.=" AND city LIKE '%$input_data->city%' ";
				
			}
			
			if(!empty($input_data->state)){
				
				$where.=" AND state LIKE '%$input_data->state%' ";
				
			}
			
			if(!empty($input_data->country)){
				
				$where.=" AND country LIKE '%$input_data->country%' ";
				
			}
			if(!empty($input_data->postcode)){
				
				$where.=" AND postcode LIKE '%$input_data->postcode%' ";
				
			}
			if(!empty($input_data->company)){
				
				$where.=" AND company LIKE '%$input_data->company%' ";
				
			}
			if(!empty($input_data->created_date)){
				
				$where.=" AND DATE(created) = '$input_data->created_date' ";
				
			}
			if(!empty($input_data->phone)){
				
				$where.=" AND (phone LIKE '%$input_data->phone%' OR mobile LIKE '%$input_data->mobile%' ) ";
				
			}
			if(!empty($input_data->email)){
				
				$where.=" AND ( email LIKE '%$input_data->email%' ) ";
				
			}
			$stmt = $this->conn->prepare("SELECT email,username,firstname,lastname,company, country, city, phone, mobile,zipcode from users WHERE 1=1 $where");
			
			if ($stmt->execute()){
				$result = $this->fetchArray($stmt);
				return $result;				
			}
			else{
				return NULL;
			}
	}
}
 
$tf = new Users_Functions($data);


if($task=="list"){
	$result_data=$tf->getUsers($data);
	$response["error"] = FALSE;
	$response["error_msg"] = "";
	$response["data"] = $result_data;
	echo json_encode($response);
}
?>