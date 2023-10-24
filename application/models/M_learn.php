<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_Learn extends CI_Model
{
	public function __construct(){
        parent::__construct();
        $this->load->helper(array('url', 'form'));
        $this->load->library("session");
    }
	public function check_own($id_user, $id_cs)
	{
		$this->db->from('own')->where('id_user', $id_user)->where('id_cs', $id_cs);
    	return $this->db->count_all_results();
	}
	public function check_teacher($id_user, $id_cs)
	{
		$this->db->from('course')->where('id_user', $id_user)->where('id_cs', $id_cs);
    	return $this->db->count_all_results();
	}
	public function show_once($id_cs)
	{
		// SELECT * FROM course, user WHERE course.id_user = user.id_user AND id_cs = 12
		$this->db->where('id_cs', $id_cs);
		$this->db->where('course.id_user = user.id_user');
		$query = $this->db->get('course, user');
		return $query->result_array();
	}
	public function show_comment($id_cs)
	{
		$this->db->where('id_cs', $id_cs)->order_by('id_cmt', 'DESC');;
		$query = $this->db->get('cmt');
		return $query->result_array();
	}
	public function add_comment($item)
	{
		$this->db->insert('cmt', $item);
	}
	public function show_link_episode($id_cs, $ep_number)
	{
		// SELECT * FROM episodes_course WHERE id_cs = 12 AND ep_number = 1
		$this->db->where('id_cs', $id_cs)->where('ep_number', $ep_number);
		$query = $this->db->get('episodes_course');
		return $query->result_array();
	}
	public function show_episode($id_cs)
	{
		// SELECT * FROM episodes_course WHERE id_cs = 12 ORDER BY ep_number ASC
		$this->db->where('id_cs', $id_cs)->order_by('ep_number', 'ASC');
		$query = $this->db->get('episodes_course');
		return $query->result_array();
	}
}