<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
class Employee extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('EmployeeModel');
    }    
    public function index() {
        $data['page'] = 'export-excel';
        $data['title'] = 'Export Excel data';
        $data['employeeData'] = $this->EmployeeModel->employeeList();
        $this->load->view('v_admin', $data);
    }
    public function createExcel() {
        $fileName = 'employee.xlsx';  
        $employeeData = $this->EmployeeModel->employeeList();
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $sheet->setCellValue('A1', 'Id');
        $sheet->setCellValue('B1', 'Khách hàng');
        $sheet->setCellValue('C1', 'Khoá học đã mua');
        $sheet->setCellValue('D1', 'Giá tiền');
        $sheet->setCellValue('E1', 'Mã giảm giác');
        $sheet->setCellValue('F1', 'Ngày mua');       
        $rows = 2;
        foreach ($employeeData as $val){
            $sheet->setCellValue('A' . $rows, $val['id']);
            $sheet->setCellValue('B' . $rows, $val['name_user']);
            $sheet->setCellValue('C' . $rows, $val['ten_cs']);
            $sheet->setCellValue('D' . $rows, $val['gia_cs']);
            $sheet->setCellValue('E' . $rows, $val['code_cp']);
            $sheet->setCellValue('F' . $rows, $val['date_own']);
            
            $rows++;
        } 
        $writer = new Xlsx($spreadsheet);
        $writer->save("upload/".$fileName);
        header("Content-Type: application/vnd.ms-excel");
        redirect(base_url()."/upload/".$fileName);              
    }    
}
?>