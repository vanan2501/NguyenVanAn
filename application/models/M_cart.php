<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_Cart extends CI_Model
{
	public function show_all_cart()
	{
		// SELECT * FROM course, user WHERE id_cs IN (SELECT id_cs FROM cart WHERE id_user = 1) AND course.id_user = user.id_user
		$id_user = $this->session->userdata('id_user');
		$this->db->where('id_cs IN (SELECT id_cs FROM cart WHERE id_user = '.$id_user.')', NULL, FALSE)->where('course.id_user = user.id_user');
		$query = $this->db->get('course, user');
		return $query->result_array();
	}
	// 
	// 
	// Apply Coupon
	// 
	// 
	public function check_coupon($coupon)
	{
		// SELECT code_cp FROM coupon WHERE code_cp = 'coupon10'
		$this->db->select('code_cp')->from('coupon')->where('code_cp', $coupon);
		return $this->db->count_all_results();
	}
	public function expiration($coupon)
	{
		// SELECT expiration_date FROM coupon WHERE code_cp = 'coupon10'
		$this->db->select('expiration_date')->where('code_cp', $coupon);
		$query = $this->db->get('coupon');
		foreach ($query->result_array() as $row) {
			$date_expiration = $row['expiration_date'];
		}
		return $date_expiration;
	}
	public function coupon_apply($coupon)
	{
		$query = $this->db->where('code_cp', $coupon)->get('coupon');
		return $query->result_array();
	}
	// 
	// 
	// Apply Coupon
	// 
	// 
	public function count()
	{
		$id_user = $this->session->userdata('id_user');
		$this->db->from('cart')->where('id_user', $id_user);
		return $this->db->count_all_results();
	}
	public function delete_once_cart($id_cs)
	{
		$id_user = $this->session->userdata('id_user');
		$this->db->where('id_cs', $id_cs)->where('id_user', $id_user);
		$this->db->delete('cart');
	}
	public function delete_all_cart($id)
	{
		$this->db->where('id_user', $id);
		$this->db->delete('cart');
	}
	public function buy_all_cart($code_cp)
	{
		// Lấy ID Coupon
		// SELECT id_cp FROM coupon WHERE code_cp = ''
		$this->db->select('id_cp')->where('code_cp', $code_cp);
		$result_cp = $this->db->get('coupon')->result_array();
		if ($result_cp == null) {
			$id_cp = null;
		}
		else{
			foreach ($result_cp as $row) {
				$id_cp = $row['id_cp'];
			}
		}
		# Chuyển csdl vào bảng own
		$id = $this->session->userdata('id_user');
		$this->db->where('id_user', $id);
		$result = $this->db->get('cart')->result_array();
		foreach ($result as $row) {

			$data = array(
				'id_user' => $row['id_user'],
				'id_cs' => $row['id_cs'],
				'id_cp' => $id_cp,
				'date_own' => date("Y-m-d"),
			);
			// Cộng tiền cho chủ khóa học (Giáo viên)
			$this->db->where('id_cs', $data['id_cs']);
			$result2 = $this->db->get('course')->result_array();
			foreach ($result2 as $row2) {
				$id_teacher = $row2['id_user'];
				$money = $row2['gia_cs']-$row2['gia_cs']*40/100;
			}
			$this->db->where('id_user', $id_teacher);
			$result3 = $this->db->get('user')->result_array();
			foreach ($result3 as $row3) {
				$old_money = $row3['coin_user']+$money;
				$this->db->set('coin_user', $old_money, FALSE);
				$this->db->where('id_user', $id_teacher);
				$this->db->update('user');
			}
			// Kết thúc cộng tiền cho chủ khóa học
			$this->db->insert('own', $data);

		}
		$this->delete_all_cart($id);
		# Update tiền cho user
		$tien_thua = $this->session->userdata['tien_thua'];
		$this->db->set('coin_user', $tien_thua, FALSE);
		$this->db->where('id_user', $id);
		$this->db->update('user');
		$this->session->userdata['coin_user'] = $this->session->userdata['tien_thua'];
		// $this->session->unset_userdata['tien_thua'];
	}
}

