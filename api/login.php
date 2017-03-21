<?php
require_once 'include/CommonFunctions.php';

if (isset($data->username) && isset($data->password)) {
 
    // receiving the post params
    $email = $data->username;
    $password = base64_decode($data->password);
	
    // get the user by email and password
    $user = $cf->getUserByEmailAndPassword($email, $password);
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
}
?>