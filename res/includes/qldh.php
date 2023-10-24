
<h1>Quản lý đơn hàng</h1>

<hr>
<table id="example" class="table table-hover table-bordered " style="width:100%" >
	<thead>
		<tr>
			<th>ID</th>
			<th>Khách hàng</th>
			<th>Khóa học đã mua</th>
			<th>Giá tiền</th>
			<th>Mã giảm giá</th>
			<th>Ngày mua</th>
			<th></th>
		</tr>
	</thead>
	<a class="pull-right btn btn-warning btn-large" style="margin-right:40px" href="<?php echo site_url(); ?>/employee/createexcel"><i class="fa fa-file-excel-o"></i> Export to Excel</a>
	<tbody>
	<?php $i=0;
		foreach ($result as $key => $value) {
	?>
		<tr>
			<td><?php $i++; echo $i; ?></td>
			<td><?php echo $value['name_user']; ?></td>
			<td><a href="<?php echo base_url('display?id=').$value['id_cs']; ?>"><?php echo $value['ten_cs']; ?></a></td>
			<td><?php echo number_format($value['gia_cs']-$value['gia_cs']*$value['percent_discount']/100); ?></td>
			<td><p class="text-muted"><?php echo $value['code_cp']; ?></p></td>
			<td><?php echo $value['date_own']; ?></td>
			<td>
				<a class="btn btn-danger" href="" onclick="return confirm('Bạn thực sự muốn xóa đơn hàng này?')"><i class="fa fa-times"></i></a>
			</td>
		</tr>
	<?php } ?>
	</tbody>
	<tfoot>
		<tr>
			<th>iD</th>
			<th>Khách hàng</th>
			<th>Khóa học đã mua</th>
			<th>Giá tiền</th>
			<th>Mã giảm giá</th>
			<th>Ngày mua</th>
			<th></th>
		</tr>
	</tfoot>
</table>
<div class="container">
	<div class="row">
		<div class="col-sm-6 push-sm-3 ">
			
		</div>
	</div>
</div>

