<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Courses extends CI_Controller {

	public function __construct() 
	{
		parent::__construct();
		$this->load->helper(array('url', 'form'));	
		$this->load->library("session");
		$this->load->library('pagination');
		
	}
	public function index()
	{
		// Lọc
		if ($this->input->post('filter')) {
			$name = $this->input->post('name');
			$price = $this->input->post('price');
			if ($name != '' && $price != '') {
				$filter = $name.', '.$price;
			}
			if ($name != '' && $price == '') {
				$filter = $name;
			}
			if ($price != '' && $name == '') {
				$filter = $price;
			}
			if ($name == '' && $price == '') {
				$filter = 'id_cs ASC';
			}
			$this->session->set_userdata("filter", $filter);
		}
		else{
			if ($this->session->has_userdata('filter')) {
				$filter = $this->session->userdata('filter');
			} else {
				$filter = 'id_cs ASC';
			}
		}
		// Tìm kiếm
		if ($this->input->post('search') == 'search') {
			$keyword = $this->input->post('keyword');
			$this->session->set_userdata("keyword", $keyword);
		}
		else{
			if ($this->session->has_userdata('keyword')) {
				$keyword = $this->session->userdata('keyword');
			} else {
				$keyword = '';
			}
		}
//Số bài trong 1 trang
		$limit= 6;
//Số bài trong 1 trang

		$this->load->model('m_courses');
		$model = new M_Courses();
		$query_poster = $model->showall($limit, $keyword, $filter);
		$countrow = $model->countrow($keyword);
// pagination        
		$config['base_url'] = base_url() . '/courses/';
		$config['total_rows'] = $countrow;
		$config['uri_segment']  = 2;
		$config['per_page'] = $limit;
		$config['prev_link']  = '&laquo;';
		$config['next_link']  = '&raquo;';
		$config['last_link']  = FALSE;
		$config['first_link'] = FALSE;
		$num_pages = $config["total_rows"] / $config["per_page"];
		$config["num_links"] = round($num_pages);
		$config['next_tag_open'] =  '<li>';
		$config['next_tag_close'] =  '</li>';
		$config['prev_tag_open'] =  '<li>';
		$config['prev_tag_close'] =  '</li>';
		$config['num_tag_open'] =  '<li>';
		$config['num_tag_close'] =  '</li>';
		$config['cur_tag_open'] =  '<li class="active"><a href="#">';
		$config['cur_tag_close'] =  '<span class="sr-only"></span></a></li>';
		$this->pagination->initialize($config);
		$paginator = $this->pagination->create_links();  
// End pagination  
		$category = array(
			array('key' => 'c', 'count' => $model->row_c(), 'name' => 'Lập trình c++', ),
			array('key' => 'android', 'count' => $model->row_android(), 'name' => 'Lập trình android',),
			array('key' => 'c#', 'count' => $model->row_cThang(), 'name' => 'Lập trình C#.Net', ),
			array('key' => 'java', 	'count' => $model->row_java(), 'name' => 'Lập trình Java', ),
			array('key' => 'pttk', 'count' => $model->row_pttk(), 'name' => 'Phân tích thiết kế', ),
			array('key' => 'python', 'count' => $model->row_python(), 'name' => 'Lập trình Python', ),
			array('key' => 'thvp', 'count' => $model->row_thvp(), 'name' => 'Tin học văn phòng', ), 
		);    
		$fee = array('free' => $model->row_free(), 'fee' => $model->row_fee(), ); 
		$this->load->view('v_courses'); 
		$view = new V_Courses();
		$view->index($countrow, $query_poster, $paginator, $category, $fee, $keyword, $filter);
	}
	public function cancel_search()
	{
		$this->session->unset_userdata('keyword');
		$this->session->unset_userdata('filter');
		redirect(base_url('courses'));
	}
	public function category($value='')
	{
		$this->session->set_userdata("keyword", $value);
		redirect(base_url('courses'));
	}
}