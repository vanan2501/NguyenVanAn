<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class M_Courses extends CI_Model
{
	function __construct()
	{
        parent::__construct();
    }

    public function showall($limit, $keyword, $filter)
    {
    	$offset=$this->uri->segment(2);
        /*
        SELECT id_cs,thumb_cs,ten_cs,name_user,gia_cs 
        FROM course, user 
        WHERE course.id_user = user.id_user 
        AND (course.ten_cs LIKE '%%' OR user.name_user LIKE '%%' OR course.id_cate LIKE '%%') 
        ORDER BY `course`.`id_cs` ASC 
        */
    	$this->db->select('id_cs,thumb_cs,ten_cs,name_user,gia_cs');                  
        $this->db->from('course, user');
        $this->db->where('course.id_user = user.id_user');
        $custom = "(course.ten_cs LIKE '%$keyword%' OR user.name_user LIKE '%$keyword%' OR course.id_cate LIKE '%$keyword%')";
        $this->db->where($custom);
		$this->db->order_by($filter);          
		$this->db->limit($limit, $offset);

		$query_poster = $this->db->get();
		return $query_poster;
    }
    
    public function countrow($keyword)
    {
        $this->db->from('course')->like('ten_cs', $keyword)->or_like('id_user', $keyword)->or_like('id_cate', $keyword);
    	return $this->db->count_all_results();
    }

    # Count each catelogy
    public function row_c()
    {
        $this->db->from('course')->where('id_cate', 'c');
        return $this->db->count_all_results();
    }
    public function row_android()
    {
        $this->db->from('course')->where('id_cate', 'android');
        return $this->db->count_all_results();
    }
    public function row_cThang()
    {
        $this->db->from('course')->where('id_cate', 'c#');
        return $this->db->count_all_results();
    }
    public function row_java()
    {
        $this->db->from('course')->where('id_cate', 'java');
        return $this->db->count_all_results();
    }
    public function row_pttk()
    {
        $this->db->from('course')->where('id_cate', 'pttk');
        return $this->db->count_all_results();
    }
    public function row_python()
    {
        $this->db->from('course')->where('id_cate', 'python');
        return $this->db->count_all_results();
    }
    public function row_thvp()
    {
        $this->db->from('course')->where('id_cate', 'thvp');
        return $this->db->count_all_results();
    }

    // Free and Fee
    public function row_free()
    {
        $this->db->from('course')->where('gia_cs', 0);
        return $this->db->count_all_results();
    }
    public function row_fee()
    {
        $this->db->from('course')->where('gia_cs !=', 0);
        return $this->db->count_all_results();
    }
}