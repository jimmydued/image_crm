<?php
require_once 'include/CommonFunctions.php';
        
class CrmProducts_Functions extends Common_Functions{
 
    // constructor
    function __construct($input_data){
		parent::__construct();
        $this->keepValidateUser($input_data);
    }	
	/**
		* edit CRM products
	*/
	function addUpdateProduct($input_data) { 
			
			if(isset($input_data->id) && $input_data->id>0){
				$stmt = $this->conn->prepare("UPDATE products SET name='".$input_data->name."',
				keywords = '".$input_data->keywords."',price='".$input_data->price."', img_sizes='".$input_data->img_sizes."',
				active = '".$input_data->active."',product_type='".$input_data->product_type."', video_type='".$input_data->video_type."',
				product_video = '".$input_data->product_video."',youtube_video='".$input_data->youtube_video."', 
				product_image='".$input_data->product_image."',new_product='".$input_data->new_product."',
				featured_product='".$input_data->featured_product."',crm_product='1',rating='".$input_data->rating."',
				modified='".date('Y-m-d h:i:s')."' WHERE id=".$input_data->id."
					");
			}
			else{
					$stmt = $this->conn->prepare("INSERT INTO 
					SET name='".$input_data->name."',
				keywords = '".$input_data->keywords."',price='".$input_data->price."', img_sizes='".$input_data->img_sizes."',
				active = '".$input_data->active."',product_type='".$input_data->product_type."', video_type='".$input_data->video_type."',
				product_video = '".$input_data->product_video."',youtube_video='".$input_data->youtube_video."', 
				product_image='".$input_data->product_image."',new_product='".$input_data->new_product."',
				featured_product='".$input_data->featured_product."',crm_product='1',rating='".$input_data->rating."',
				created='".date('Y-m-d h:i:s')."'
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

	function addProduct($input_data) { 
			
			$where="";

			$stmt = $this->conn->prepare("INSERT INTO 
			SET name='".$input_data->name."',
				keywords = '".$input_data->keywords."',price='".$input_data->price."', img_sizes='".$input_data->img_sizes."',
				active = '".$input_data->active."',product_type='".$input_data->product_type."', video_type='".$input_data->video_type."',
				product_video = '".$input_data->product_video."',youtube_video='".$input_data->youtube_video."', 
				product_image='".$input_data->product_image."',new_product='".$input_data->new_product."',
				featured_product='".$input_data->featured_product."',crm_product='1',rating='".$input_data->rating."',
				created='".date('Y-m-d h:i:s')."'
			
			");
			
			if ($stmt->execute()) {
				$stmt->close();
				
			} else {
				return NULL;
			}
	}
	/**
		* get CRM products
	*/
	function getProducts() { 
			
			$where = "";

			$stmt = $this->conn->prepare("Select * from products where crm_product=1 order by id desc");

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
		* get CRM product Grid Data
	*/
	function getGridData(){
		$result_data		=	$this->getProducts();
		$response["error"] 	= 	FALSE;
		$response["data"] 	= 	$result_data;
		echo json_encode($response);
	}
	/**
		* get CRM product individual information
	*/	
	function getProductInformation($id) { 
			
			$where = "";

			$stmt = $this->conn->prepare("Select * from products where id=".$id);

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
 
$obj = new CrmProducts_Functions($data);

if($task=="list"){

	if(isset($data->id)){
		if(isset($data->operationType) && $data->operationType=="updateProduct"){
			$result_data=$obj->addUpdateProduct($data);
			$obj->getGridData();	
		}
		else
		{
			$result_data=$obj->getProductInformation($data->id);
			$response["error"] = FALSE;
			$response["data"] = $result_data;
			echo json_encode($response);	
		}				
	}
	else
	{
		if($data->operationType=="set"){
			$result_data=$obj->addUpdateProduct($data);
		}
		$obj->getGridData();
	}	
}
?>