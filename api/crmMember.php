<?php
require_once 'include/CommonFunctions.php';
        
class CrmMembers_Functions extends Common_Functions{
 
    // constructor
    function __construct($input_data){
		parent::__construct();
        $this->keepValidateUser($input_data);
    }	
	/**
		* Delete CRM members
	*/
	function deleteUser($input_data) { 
			
			if(isset($input_data->id) && $input_data->id>0){
				$stmt = $this->conn->prepare("DELETE FROM admins WHERE id=".$input_data->id."
					");
			}			
			
			if ($stmt->execute()) {
				$stmt->close();
				
			}
			else
			{
				return NULL;
			}
	}
	/**
		* edit CRM members
	*/
	function addUpdateUser($input_data) { 
			
			if(isset($input_data->id) && $input_data->id>0){
				$stmt = $this->conn->prepare("UPDATE admins SET username='".$input_data->username."',password = '".md5(base64_decode($input_data->password))."',firstname='".$input_data->firstname."', lastname='".$input_data->lastname."', email='".$input_data->email."' WHERE id=".$input_data->id."
					");
			}
			else{
					$stmt = $this->conn->prepare("INSERT INTO admins (username, password, firstname, lastname, email, status, type) VALUES ('$input_data->username','".md5(base64_decode($input_data->password))."','$input_data->firstname','$input_data->lastname','$input_data->email',0,'CRMUSERS')
					");				
			}			
			
			if ($stmt->execute()) {
				$stmt->close();
				
			}
			else
			{
				return NULL;
			}
	}

	function addUser($input_data) { 
			
			$where="";

			$stmt = $this->conn->prepare("INSERT INTO admins (username, password, firstname, lastname, email, status, type) VALUES ('$input_data->username','".md5($input_data->password)."','$input_data->firstname','$input_data->lastname','$input_data->email',0,'CRMUSERS')
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
	function getUsers() { 
			
			$where = "";

			$stmt = $this->conn->prepare("Select id,username,firstname,lastname,email,status,type from admins order by id desc");

			if ($stmt->execute()) {				
				$result = $this->fetchArray($stmt);
				return $result;				
			}
			else
			{
				return NULL;
			}
	}
	/**
		* get CRM member Grid Data
	*/
	function getGridData(){
		$result_data		=	$this->getUsers();
		$response["error"] 	= 	FALSE;
		$response["data"] 	= 	$result_data;
		echo json_encode($response);
	}
	/**
		* get CRM member individual information
	*/	
	function getUserInformation($id) { 
			
			$where = "";

			$stmt = $this->conn->prepare("Select id,username,firstname,lastname,email,status,type from admins where id=".$id);

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

	if(isset($data->id) && $data->operationType!="getUsernameEmail"){

		if(isset($data->operationType) && $data->operationType=="updateUser"){
			$result_data=$obj->addUpdateUser($data);
			$obj->getGridData();	
		}
		else if(isset($data->operationType) && $data->operationType=="deleteUser"){
			$result_data=$obj->deleteUser($data);
			$obj->getGridData();	
		}
		else
		{
			$result_data=$obj->getUserInformation($data->id);
			$response["error"] = FALSE;
			$response["data"] = $result_data;
			echo json_encode($response);	
		}				
	}
	else
	{
		if($data->operationType=="getUsernameEmail"){
			
			if(!isset($data->id)){
				$data->id = null; 
			}

			$result_data=$obj->isUserExistedByUsername($data->checkParam,$data->id);
			
			$response["error"] = FALSE;
			
			if($result_data==1){
				$response["data"] = false;	
			}
			else{
				$response["data"] = true;	
			}			
			echo json_encode($response);
		}
		else
		{
			if($data->operationType=="set"){
				$result_data=$obj->addUpdateUser($data);
			}
			$obj->getGridData();	
		}
	}	
}
?>