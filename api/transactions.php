<?php
require_once 'include/CommonFunctions.php';
        
class Transactions_Functions extends Common_Functions{
 
    // constructor
    function __construct($input_data) {
        //$this->keepValidateUser($input_data);
    }	
	/**
		 * Get transactions
	 */
	function getTransactions() { 
	 
			$stmt = $this->conn->prepare("SELECT a.id, a.txn_id, a.order_total, a.order_date, a.order_status,b.username  FROM orders as a left join users as b on a.user_id=b.id");
	            
			if ($stmt->execute()) {
				$result = $stmt->get_result()->fetch_assoc();
				$stmt->close();
				return $result;
				
			} else {
				return NULL;
			}
	}
} 

$tf = new Transactions_Functions();


if($task=="list"){
	$result_data=$tf->getTransactions();
	$response["error"] = FALSE;
	$response["error_msg"] = "";
	$response["data"] = $result_data;
	echo json_encode($response);
}
?>