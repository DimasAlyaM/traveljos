<?php

class Pembayaran extends CI_Controller{
	function __construct(){
		parent::__construct();
		$this->load->model('m_sistem');
		$this->load->model('m_data');
		$this->load->helper('date');
		$this->load->helper(array('form', 'url'));
	}

	public function index(){
		$key = $this->input->get('key');
		$session_key = $this->input->get('key');
		$reservation_code = $this->input->get('reservation_code');
		$data['data_rute'] = $this->m_sistem->get_rute($this->session->userdata($session_key)['rute_id'])[0];
		$data['customer_data'] = $this->session->userdata($key);
		$data['data_reservation'] = $this->m_sistem->get_reservation($reservation_code);
		// $gmt = local_to_gmt(time());
		// $lokal = gmt_to_local($gmt,'UP7');
		// $bad_date = unix_to_human($lokal,'us');	
		$nice_date = nice_date(unix_to_human(gmt_to_local(local_to_gmt(time()),'UP7'),'us'), 'd/m/Y H:i:s');
		$data['reservasi_tanggal'] = substr($nice_date, 0,10);
		$data['reservasi_jam'] = substr($nice_date, 11);

		$this->load->view('layout/header');
		$this->load->view('v_pembayaran',$data);
		$this->load->view('layout/footer');
		
				
	}
}