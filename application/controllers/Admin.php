<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('m_admin');
		$this->load->library('Twig');


	}


	public function index()
	{
		if(!$this->validaSesion()){
			$this->load->view('sbAdmin/login');
		}else{
		   redirect('admin/dashboard');

		}


	}

	public function dashboard(){
		if (!$this->validaSesion() ){
			redirect('admin');
		}else{
			$this->load->view('sbAdmin/pages/index');
		}

	}


	function altaimagenproducto($mostrar){
		if (!$this->validaSesion() ){
			redirect('admin');
		}else{
			$this->load->view('sbAdmin/pages/producto_bien',$mostrar);
		}
	}


	function altaimagenservicio($mostrar){
				$this->load->view('sbAdmin/pages/servicio_bien',$mostrar);
	}


	function altaproducto(){
		if (!$this->validaSesion() ){
			redirect('admin');
		}else{
			$datos['productos']=$this->m_admin->getTipoProducto();
			$this->load->view('sbAdmin/pages/producto',$datos);
		}

	}

	function altaservicio(){
		if (!$this->validaSesion() ){
			redirect('admin');
		}else{
			$datos['servicios']=$this->m_admin->getTipoServicio();
			$this->load->view('sbAdmin/pages/servicio',$datos);
		}
	}



	function eliminaproducto(){
		if (!$this->validaSesion() )
			redirect('admin');
		else {
			$datos['productos']=$this->m_admin->getProducto();
			$this->load->view('sbAdmin/pages/elimina',$datos);
		}
	}

	function editaproducto(){
		$datos['productos']=$this->m_admin->getProducto();
		$this->load->view('sbAdmin/pages/editaProducto',$datos);
	}

	function editaservicio(){
		$datos['servicios']=$this->m_admin->getServicio();
		$this->load->view('sbAdmin/pages/editaServicio',$datos);
	}



	function editProduct(){

		if (!$this->validaSesion() ){
			redirect('admin');
		}else{

			$this->form_validation->set_message('required','El campo es requerido para que se pueda eliminar');
			$this->form_validation->set_rules('modelo','Modelo','required');

			if($this->form_validation->run()==FALSE){
				$this->editaproducto();

			}
			else{

				$idproducto=$this->input->post('modelo');
				redirect('admin/editarProducto/'.$idproducto);
			}

		}



	}

	function editService(){


		$this->form_validation->set_message('required','El campo es requerido para que se pueda eliminar');
		$this->form_validation->set_rules('nombre','Nombre','required');

		if($this->form_validation->run()==FALSE){
			$this->editaservicio();

		}
		else{

			$idservicio=$this->input->post('nombre');
			redirect('admin/editarServicio/'.$idservicio);
		}
	}





	function editarProducto($id){
		if (!$this->validaSesion() ){
			redirect('admin');
		}else{
			$datosproducto = $this->m_admin->getIndividualProduct($id);
			$datos['producto']=$datosproducto[0];
			$datos['tipo']=$this->m_admin->getTipoProducto();
			$this->load->view('sbAdmin/pages/producto_editar',$datos);
		}
	}

	function editarServicio($id){
		if (!$this->validaSesion() ){
			redirect('admin');
		}else{
			$datosservicio = $this->m_admin->getIndividualService($id);
			$datos['servicio']=$datosservicio[0];
			$datos['tipo']=$this->m_admin->getTipoServicio();
			$this->load->view('sbAdmin/pages/servicio_editar',$datos);
		}
	}



	function updateProduct(){
		$this->form_validation->set_message('required','El campo <b>%s</b> es requerido');
		$this->form_validation->set_message('is_unique','El  <b>%s</b> ya esta existe Don Pancho !!!');

	    $this->form_validation->set_rules('modelo','Modelo','required|is_unique[producto.modelo]|min_length[2]|max_length[60]');
	    $this->form_validation->set_rules('tipo','Tipo','required');
	    $this->form_validation->set_rules('descripcion','Desscripcion','required|min_length[5]|max_length[70]');

	    $this->form_validation->set_rules('precio','Precio','required|callback_regex_check');
	    $id=$this->input->post('idproducto');

	    if($this->form_validation->run()==FALSE){
	    $this->editarProducto($id);
	    //redirect('admin/editarProducto/'.$id);

		}
		else{

			$datos['modelo'] =$this->input->post('modelo');
			$datos['idtipo_producto'] =$this->input->post('tipo');
			$datos['descripcion'] =$this->input->post('descripcion');
			$datos['precio'] =$this->input->post('precio');
			//insertar los datos en la base de datos
			//print_r(" esta bien");
			$this->m_admin->updateProduct($datos,$id);
			$this->editaproducto();
		}

	}

	function updateService(){
		$this->form_validation->set_message('required','El campo <b>%s</b> es requerido');
		$this->form_validation->set_message('is_unique','El  <b>%s</b> ya esta existe Don Pancho !!!');

	    $this->form_validation->set_rules('nombre','Nombre','required|is_unique[servicio.nombre]|min_length[2]|max_length[60]');
	    $this->form_validation->set_rules('tipo','Tipo','required');
	    $this->form_validation->set_rules('descripcion','Desscripcion','required|min_length[5]|max_length[70]');
	    $id=$this->input->post('idservicio');

	    if($this->form_validation->run()==FALSE){

	    $this->editarServicio($id);
	    //redirect('admin/editarProducto/'.$id);

		}
		else{

			$datos['nombre'] =$this->input->post('nombre');
			$datos['idtipo_servicio'] =$this->input->post('tipo');
			$datos['descripcion'] =$this->input->post('descripcion');
			//insertar los datos en la base de datos
			$this->m_admin->updateService($datos,$id);
			$this->editaservicio();
		}

	}


 	function regex_check($str){
			if(1 !== preg_match('/^\d{1,4}?([.]?[0-9]{0,2})$/', $str) ){
				$this->form_validation->set_message('regex_check', 'el %s esta mal escrito');
				return FALSE;
			}
			else{
				return TRUE;
			}
	}

	function deleteProduct(){
		$this->form_validation->set_message('required','El campo es requerido para que se pueda eliminar');
		$this->form_validation->set_rules('modelo','Modelo','required');

		if($this->form_validation->run()==FALSE){
			$this->eliminaproducto();

		}
		else{

			$idproducto=$this->input->post('modelo');
			//	obtener el nombre de la imagen y eliminarla
			//	del servidor
			$this->m_admin->deletephoto($idproducto);
			$this->m_admin->deleteproduct($idproducto);
			redirect('admin/eliminaproducto');
		}

	}


		function addProduct(){
					global $idproducto;
				$this->form_validation->set_message('required','El campo <b>%s</b> es requerido');
				$this->form_validation->set_message('is_unique','El  <b>%s</b> ya esta existe Don Pancho !!!');

			    $this->form_validation->set_rules('modelo','Modelo','required|is_unique[producto.modelo]|min_length[2]|max_length[60]');
			    $this->form_validation->set_rules('tipo','Tipo','required');
			    $this->form_validation->set_rules('descripcion','Desscripcion','required|min_length[5]|max_length[70]');

			    $this->form_validation->set_rules('precio','Precio','required|callback_regex_check');



			    if($this->form_validation->run()==FALSE){
					$this->altaproducto();

				}
				else{

					$datos['modelo'] =$this->input->post('modelo');
					$datos['idtipo_producto'] =$this->input->post('tipo');
					$datos['descripcion'] =$this->input->post('descripcion');
					$datos['precio'] =$this->input->post('precio');
					//insertar los datos en la base de datos

						$this->m_admin->insertarProducto($datos);


					$id=$this->input->post('tipo');
					$modelo=$this->input->post('modelo');

					 $idproducto = $this->m_admin->idProducto($modelo);
					$nombre=$this->m_admin->nombreProducto($id);


					$mostrar['nombre']=$nombre[0];
					$mostrar['producto']=$idproducto[0];

					$this->altaimagenproducto($mostrar);
					//redirect("admin/altaimagenproducto");


				}

			}

		function addServicio(){
			 global $idservicio;
			 $this->form_validation->set_message('required','El campo <b>%s</b> es requerido');

			$this->form_validation->set_message('is_unique','El  <b>%s</b> ya esta existe Don Pancho !!!');

			$this->form_validation->set_rules('nomservicio','Nombe del servicio','required|is_unique[servicio.nombre]|min_length[2]|max_length[60]');
			$this->form_validation->set_rules('tipo','Tipo','required');
			$this->form_validation->set_rules('desservicio','Descripcion del servicio','required|min_length[5]|max_length[70]');

			if($this->form_validation->run()==FALSE){
					$this->altaservicio();

				}
				else{

					$datos['nombre'] =$this->input->post('nomservicio');
					$datos['idtipo_servicio'] =$this->input->post('tipo');
					$datos['descripcion'] =$this->input->post('desservicio');

					//insertar los datos en la base de datos
						$this->m_admin->insertarServicio($datos);

						$id=$this->input->post('tipo');
						$nomServ=$this->input->post('nomservicio');

						$idservicio = $this->m_admin->idServicio($nomServ);
						$nombre=$this->m_admin->nombreServicio($id);


						$mostrar['nombre']=$nombre[0];
						$mostrar['servicio']=$idservicio[0];
						$this->altaimagenservicio($mostrar);
				}
		}


	function upload_server($id,$tipo){

		if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
				$filenametmp= $_FILES["file"]["tmp_name"];
				$file = $_FILES["file"]["name"];
				if(!is_dir("uploads/"))
				mkdir("uploads/", 0777);

				switch ($tipo) {
					case 1:
						if($file && move_uploaded_file($filenametmp, "uploads/".$file)){
							$dir= "uploads/".$file;

							$datos['titulo']= $file;
							$datos['direccion']= $dir;
							$datos['idproducto']=$id;
							$this->m_admin->insertImageProduct($datos);
						}
						break;

					case 2:
						if($file && move_uploaded_file($filenametmp, "uploads/".$file)){
							$dir= "uploads/".$file;

							$datos['titulo']= $file;
							$datos['direccion']= $dir;
							$datos['idservicio']=$id;
							$this->m_admin->insertImageService($datos);
						}
						break;

					default:
						break;
				}

		}

	}


function thumbnail($id,$tipo){
		 $result  = array();

		switch ($tipo) {
			case 1:
				$files = $this->m_admin->getIndividualProduct($id);
			    if (!	is_null($files) ) {
			        foreach ( $files as $file ) {
			            if ( '.'!=$file && '..'!=$file) {
			              	  $obj['name'] = $file['titulo'];
			                  $obj['size'] = filesize($file['direccion']);
			                $result[] = $obj;
			            }
			        }
			    }
				break;

		case 2:
				$files = $this->m_admin->getIndividualService($id);
			    if (!	is_null($files) ) {
			        foreach ( $files as $file ) {
			            if ( '.'!=$file && '..'!=$file) {
			              	  $obj['name'] = $file['titulo'];
			                  $obj['size'] = filesize($file['direccion']);
			                $result[] = $obj;
			            }
			        }
			    }
				break;

			default:
				echo nada;
				break;
		}


    header('Content-type: text/json');
    header('Content-type: application/json');
    echo json_encode($result);


	}

	function delete_server($tipo){

		if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {

						$name=$this->input->post('filename');
						unlink('./uploads/'.$name);
						switch ($tipo) {
							case 1:
								$this->m_admin->deleteIndividualimgproduct($name);
								break;
							case 2:
								$this->m_admin->deleteIndividualimgservice($name);
								break;

							default:
								# code...
								break;
						}


			}
	}


	function showtables(){
		if (!$this->validaSesion() )
			redirect('admin');
		else {

			$datos['servicios']= $this->m_admin->getServicio();
			$datos['productos']=$this->m_admin->getProducto();
			$datos['usuarios']=$this->m_admin->getUsuario();
			$this->load->view('sbAdmin/pages/tables',$datos);

		}

	}


	function validaSesion(){
		if($this->session->userdata('username')!= null)
			return true;
		else
			return false;
	}

	function cierraSesion(){
		$this->session->sess_destroy();
		redirect('admin');
	}

	public function login(){
		$username=$this->input->post('username');
		$password=$this->input->post('password');
		$res=$this->m_admin->validaUsuario($username,$password);



		if(!empty($res)){
			$datos =array('username'=>$res[0]['username'],
				'password'=>$res[0]['password'],
				'idtipo_usuario'=>$res[0]['idtipo_usuario']);

			$this->session->set_userdata($datos);
			redirect('admin/dashboard');
			$this->dashboard();
		} else {
			redirect('admin');
				$this->load->view('sbAdmin/login');
		}
	}

function deleteService(){
		$this->form_validation->set_message('required','El campo es requerido para que se pueda eliminar');
		$this->form_validation->set_rules('nombre','Nombre','required');

		if($this->form_validation->run()==FALSE){
			$this->eliminaservicio();

		}
		else{

			$idservicio=$this->input->post('nombre');
			//	obtener el nombre de la imagen y eliminarla
			//	del servidor
			$this->m_admin->deletephotoservice($idservicio);
			$this->m_admin->deleteservice($idservicio);
			redirect('admin/eliminaservicio');
		}

	}

  function eliminaservicio(){
  	if (!$this->validaSesion() )
			redirect('admin');
		else {
			$datos['servicios']=$this->m_admin->getServicio();
			$this->load->view('sbAdmin/pages/eliminaServicio',$datos);

		}
	}



}

/* End of file admin.php */
/* Location: ./application/controllers/admin.php */
