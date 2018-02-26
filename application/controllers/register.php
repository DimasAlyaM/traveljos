<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('m_data');
	}

	public function index()
	{
		$this->load->view('layout/header');
		$this->load->view('v_register');
		$this->load->view('layout/footer');
	}

}

/* End of file register.php */
/* Location: ./application/controllers/register.php */