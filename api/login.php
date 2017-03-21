<?php
require_once 'include/CommonFunctions.php';

class Login extends Common_Functions{
    
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
}

$loginObj 		=  	new Login();

if (isset($data->apiKey) && isset($data->password)) {
	
    // receiving the post params
    $email 		= base64_decode($data->apiKey);
    $password 	= base64_decode($data->password);
	
    // get the user by email and password
    $user = $loginObj->getUserByEmailAndPassword($email, $password);
    if ($user != false){
        // use is found
        $response["error"] = FALSE;
        $response["firstname"] 	= $user["firstname"];
		$response["lastname"] 	= $user["lastname"];
		$response["username"] 	= $user["username"];
        $response["email"] 		= $user["email"];
        echo json_encode($response);
    } 
	else
	{
        // user is not found with the credentials
        $response["error"] = TRUE;
        $response["error_msg"] = "Login credentials are wrong. Please try again!";
        echo json_encode($response);
    }
} else {
    // required post params is missing
    $response["error"] = TRUE;
    $response["error_msg"] = "Required parameters email or password is missing!";
    echo json_encode($response);
	exit;
}
?>