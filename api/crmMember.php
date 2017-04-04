<?php
require_once 'include/CommonFunctions.php';
        
class CrmMembers_Functions extends Common_Functions{
 
    // constructor
    function __construct($input_data){
		parent::__construct();
        $this->keepValidateUser($input_data);
    }	
	/**
		* add CRM members
	*/
	function addUser($input_data) { 
			
			$where="";

			$stmt = $this->conn->prepare("INSERT INTO admins (username, password, firstname, lastname, email, status) VALUES ('$input_data->userName','$input_data->password','$input_data->firstName','$input_data->lastName','$input_data->email',0)
			");
			
			if ($stmt->execute()) {
				$stmt->close();
				
			} else {
				return NULL;
			}
	}

	/**
		* get CRM members
	*/
	function getUser($input_data) { 
			
			$where = "";

			$stmt = $this->conn->prepare("Select username,firstname,lastname,email,status from admins");

			if ($stmt->execute()) {				
				$result = $this->fethArray($stmt);
				return $result;
				
			}
			else
			{
				return NULL;
			}
	}
}
 
$obj = new CrmMembers_Functions($data);

if($task=="list"){

	if($data->operationType="get"){
		$result_data=$obj->getUser($data);
		$response["error"] = FALSE;
		$response["data"] = $result_data;
		echo json_encode($response);
	}
	else
	{
		$result_data=$obj->addUser($data);
		$response["error"] = FALSE;
		$response["data"] = 'Success';
		echo json_encode($response);			
	}
}
?>