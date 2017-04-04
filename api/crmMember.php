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

			$stmt = $this->conn->prepare("INSERT INTO admins (username, password, firstname, lastname, email, status, type) VALUES ('$input_data->username','$input_data->password','$input_data->firstname','$input_data->lastname','$input_data->email',0,'CRMUSERS')
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

			$stmt = $this->conn->prepare("Select username,firstname,lastname,email,status,type from admins");

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
 
$obj = new CrmMembers_Functions($data);

if($task=="list"){

	if($data->operationType=="set"){
		$result_data=$obj->addUser($data);
	}

	$result_data=$obj->getUser($data);

	$response["error"] = FALSE;
	$response["data"] = $result_data;
	echo json_encode($response);
}
?>