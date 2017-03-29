<?php
require_once 'include/CommonFunctions.php';
        
class TransactionsSearch_Functions extends Common_Functions{
 
    // constructor
    function __construct($input_data) {
		parent::__construct();
        $this->keepValidateUser($input_data);
    }	
	/**
		 * Get transactions
	 */
	function getTransactions() { 
	 
			
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
			
			$stmt = $this->conn->prepare("SELECT a.id, a.txn_id, a.order_total, a.order_date, a.order_status,b.username  FROM orders as a left join users as b on a.user_id=b.id WHERE 1=1 $where");
	            
			if ($stmt->execute()) {
				$result = $stmt->get_result()->fetch_assoc();
				$stmt->close();
				return $result;
				
			} else {
				return NULL;
			}
	}
} 

$tf = new TransactionsSearch_Functions($data);

if($task=="list"){
	$result_data=$tf->getTransactions();
	$response["error"] = FALSE;
	$response["error_msg"] = "";
	$response["data"] = $result_data;
	echo json_encode($response);
}
?>