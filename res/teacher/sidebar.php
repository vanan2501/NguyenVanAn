<div class="nav-side-menu">
	<div class="brand"><a href="<?php echo base_url() ?>"><img src="<?php echo base_url('res/') ?>imgs/LearnITLogo.png" alt="" width="90%"></a></div>
	<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
	<div class="menu-list">
		<ul id="menu-content" class="menu-content collapse out">
			<li class="active">
				<a href="<?php echo base_url('teacher_panel') ?>">
					<i class="fa fa-dashboard fa-lg"></i> Dashboard
				</a>
			</li>
			
			<li  data-toggle="collapse" data-target="#order" class="collapsed">
				<a><i class="fa fa-money fa-lg"></i> Đơn hàng<span class="arrow"></span></a>
			</li>
			<ul class="sub-menu collapse" id="order">
				<li><a href="<?php echo base_url('teacher_panel/qltt') ?>"> Quản lý đơn hàng</a></li>
				<li><a href="<?php echo base_url('teacher_panel/payment') ?>"> Thanh toán</a></li>
				<!-- <li><a href="<?php echo base_url('teacher_panel/chart_user') ?>"> Thống kê tiền tệ</a></li> -->
			</ul>


			<li data-toggle="collapse" data-target="#course" class="collapsed">
				<a><i class="fa fa-book fa-lg"></i> Khóa học <span class="arrow"></span></a>
			</li>  
			<ul class="sub-menu collapse" id="course">
				<li><a href="<?php echo base_url('teacher_panel/qlkh') ?>"> Tất cả khóa học</a></li>
				<li><a href="<?php echo base_url('teacher_panel/add_course') ?>"> Thêm khóa học mới</a></li>
				<!-- <li><a href="<?php echo base_url('teacher_panel/chart_course') ?>"> Thống kê khóa học</a></li> -->
			</ul>			
			<li data-toggle="collapse" data-target="#comment" class="collapsed">
				<a><i class="fa fa-comments fa-lg"></i> Bình luận <span class="arrow"></span></a>
			</li>
			<ul class="sub-menu collapse" id="comment">
				<li><a href="<?php echo base_url('teacher_panel/qlbl') ?>"> Quản lý bình luận</a></li>
				<!-- <li><a href="<?php echo base_url('teacher_panel/chart_cmt') ?>"> Thống kê bình luận</a></li> -->
			</ul>


			<li>
				<a href="<?php echo base_url('auth') ?>">
					<i class="fa fa-user fa-lg"></i> Trang cá nhân
				</a>
			</li>

			<li>
				<a href="<?php echo base_url('auth/logout') ?>" onclick="return confirm('Bạn thực sự muốn đăng xuất?')">
					<i class="fa fa-sign-out fa-lg"></i> Đăng xuất
				</a>
			</li>
		</ul>
	</div>
</div>