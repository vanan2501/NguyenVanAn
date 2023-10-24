<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Export Model
 *
 * @author TechArise Team
 *
 * @email  info@techarise.com
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class EmployeeModel extends CI_Model {

    // get employee list
    public function employeeList() {
        $this->db->select(array('own.*, user.name_user, course.ten_cs, course.gia_cs, coupon.code_cp, coupon.percent_discount'));
        $this->db->from('own');
        $this->db->join('coupon', 'own.id_cp = coupon.id_cp', 'left');
        $this->db->join('user', 'own.id_user = user.id_user', 'left');
        $this->db->join('course', 'own.id_cs = course.id_cs', 'left');
        $query = $this->db->get();
        return $query->result_array();
    }

}
