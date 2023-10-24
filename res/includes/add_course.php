<?php if (isset($_SESSION['error'])) {
	echo '<div class="alert alert-success" role="alert">'.$_SESSION['error'].'</div>';
} ?>
<form action="" method="POST" role="form" enctype="multipart/form-data">
	<legend>Thêm mới khóa học</legend>
	<div class="form-group">
		<label for="">Tên Khoá học</label>
		<input type="text" class="form-control" name="ten_cs" placeholder="Tên Khoá học" autocomplete="off">
	</div>
	<div class="form-group">
		<label for="">Thông tin thêm</label>
		<input type="text" class="form-control" name="info_cs" placeholder="Thông tin thêm" autocomplete="off">
	</div>
	<div class="form-group">
		<label for="">Mô tả</label>
		<textarea name="mota_cs" id="mota_cs" class="form-control" rows="10"></textarea>
	</div>
	<div class="form-group">
		<label for="">Giáo Trình</label>
		<textarea name="giaotrinh_cs" id="giaotrinh_cs" class="form-control" rows="10"></textarea>
	</div>
	<div class="form-group">
		<label for="">Giá</label>
		<input type="number" class="form-control" name="gia_cs" placeholder="Giá" autocomplete="off">
	</div>
	<div class="form-group">
		<label for="">Thể loại</label>
		<select name="theloai_cs" class="form-control" required="required">
			<option value="android">Lập trình android</option>
			<option value="c#">Lập trình C#.Net</option>
			<option value="c">Lập trình c++</option>
			<option value="java">Lập trình java</option>
			<option value="pttk">Phân tích thiết kế</option>
			<option value="python">Lập trình Python</option>
			<option value="thvp">Tin học văn phòng</option>
		</select>
	</div>
	<div class="form-group">
		<label for="">Số bài</label>
		<input type="number" class="form-control" name="sobh_cs" placeholder="Số bài" autocomplete="off">
	</div>
	<div class="form-group">
		<label for="">Thời lượng</label>
		<input type="text" class="form-control" name="time_cs" placeholder="Thời lượng" autocomplete="off">
	</div>
	<div class="form-group">
		<label for="">Ảnh</label>
		<input type="file" class="form-control" name="thumb_cs" accept=".jpg, .png, .jpeg">
	</div>
	<button type="submit" name="add_course" value="submit" class="btn btn-primary" name="btn-submit">Thêm mới khóa học</button>
</form>
<script src="//cdn.ckeditor.com/4.10.1/standard/ckeditor.js"></script>
<script>
	CKEDITOR.replace( 'mota_cs' );
	CKEDITOR.replace( 'giaotrinh_cs' );
</script>