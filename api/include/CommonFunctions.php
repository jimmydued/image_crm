<?php
$cf = new Common_Functions();
// json response array
$response = array("error" => FALSE);

$request_body 	= 	file_get_contents('php://input');

$data 			= 	json_decode($request_body);

$task			=	(!empty($data->task)?$data->task:"list");



class Common_Functions {
	
    protected $conn;
 
    // constructor
    function __construct() {
        require_once 'DB_Connect.php';
        // connecting to database
        $db = new Db_Connect();
        $this->conn = $db->connect();
    }
 
    // destructor
    function __destruct() {
         
    }
 
	function keepValidateUser($apiKey){
	
		if (isset($apiKey)){
 
			$username = $apiKey;
			
			// get the user by username
			$user = $cf->isUserExistedByUsername($username);
			
			if (!$user){
				// user is not found with the credentials
				$response["error"] = TRUE;
				$response["error_msg"] = "Login credentials are wrong. Please try again!";
				echo json_encode($response);
				exit;
			}
		} 
		else {
			// required post params is missing
			$response["error"] = TRUE;
			$response["error_msg"] = "You are not authrize to access!";
			echo json_encode($response);
			exit;
		}
	}
	
    /**
     * Get user by email and password
     */
    public function getUserByEmailAndPassword($email, $password) {
 
        $stmt = $this->conn->prepare("SELECT * FROM users WHERE email = ?");
 
        $stmt->bind_param("s", $email);
 
        if ($stmt->execute()) {
            $user = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            // check for password equality
            if ($user['password'] == md5($password)) {
                // user authentication details are correct
                return $user;
            }
        } else {
            return NULL;
        }
    }
 
    /**
     * Check user is existed or not
     */
    public function isUserExisted($email) {
        $stmt = $this->conn->prepare("SELECT email from users WHERE email = ?");
 
        $stmt->bind_param("s", $email);
 
        $stmt->execute();
 
        $stmt->store_result();
 
        if ($stmt->num_rows > 0) {
            // user existed 
            $stmt->close();
            return true;
        } else {
            // user not existed
            $stmt->close();
            return false;
        }
    }
	
	/**
     * Check user is existed or not by username
     */
    public function isUserExistedByUsername($username) {
        $stmt = $this->conn->prepare("SELECT username from users WHERE username = ?");
		
		$stmt->bind_param("s", $username);
 
        $stmt->execute();
 
        $stmt->store_result();
 
        if ($stmt->num_rows > 0) {
            // user existed 
            $stmt->close();
            return true;
        } else {
            // user not existed
            $stmt->close();
            return false;
        }
    }
}
 
?>