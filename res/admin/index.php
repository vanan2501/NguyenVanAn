<!DOCTYPE html>	
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content='Học trực tuyến cùng với những Giảng viên hàng đầu. Học online 24/7 - Tự tin làm chủ tương lai. Siêu thị bài giảng trực tuyến lớn nhất Việt Nam' name='description'>
	<link rel="shortcut icon" type="image/x-icon" href="<?php echo base_url('res/') ?>imgs/icon1.png">
	<title>Trang Quản Lý Của ADMIN - LearnITonline</title>
	<link rel="stylesheet" href="<?php echo base_url('res/') ?>bs/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?php echo base_url('res/') ?>awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<?php echo base_url('res/') ?>css/morris.css">
	<link rel="stylesheet" href="<?php echo base_url('res/') ?>css/admin-index.css">
	<link rel="stylesheet" href="<?php echo base_url('res/') ?>css/dataTables.bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="<?php echo base_url('application/') ?>libraries/table2excel.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
          google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
          ['Tháng', 'Số lượng đơn hàng'],
          ["Tháng 1", 2],
          ["Tháng 2", 6],
          ["Tháng 3", 5],
          ["Tháng 4", 4],
          ["Tháng 5", 4],
          ["Tháng 6", 4],
          ["Tháng 7", 0],
          ["Tháng 8", 0],
          ["Tháng 9", 0],
          ["Tháng 10", 0],
          ["Tháng 11", 0],
          ["Tháng 12", 0],

          
          
        ]);

        var options = {
          width: 800,
          legend: { position: 'none' },
          chart: {
            title: 'Bảng số lượng đơn hàng qua các tháng năm 2022',
             },
          axes: {
            x: {
              0: { side: 'top', label: 'Số lượng'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        // Convert the Classic options to Material options.
        chart.draw(data, google.charts.Bar.convertOptions(options));
      };
  </script>
</head>
<body>
	<main>
		<section class="row">
			<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
				<?php include 'res/includes/sidebar-admin.php' ?>
			</div>
			<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
				<?php include 'res/includes/'.$page.'.php' ?>
			</div>
			
		</section>
	</main>
	<!-- Script -->
	<script>
				$(function() {
				$(".xuat").click(function(){
				$("#example").table2excel({
    				name: "Excel Document Name"
				}); 
				 });
			});
	</script>
	<script type="text/javascript" src="<?php echo base_url('res/') ?>bs/js/jquery.js"></script>
	<script type="text/javascript" src="<?php echo base_url('res/') ?>bs/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url('res/') ?>js/webjs.js"></script>
	<script type="text/javascript" src="<?php echo base_url('res/') ?>js/raphael-min.js"></script>
	<script type="text/javascript" src="<?php echo base_url('res/') ?>js/morris.js"></script>
	<script type="text/javascript" src="<?php echo base_url('res/js/chart-').$page.'.js' ?>"></script>
	<script type="text/javascript" src="<?php echo base_url('res/') ?>js/jscustom.js"></script>
	<script type="text/javascript" src="<?php echo base_url('res/') ?>js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url('res/') ?>js/dataTables.bootstrap.min.js"></script>
	
</body>
</html>