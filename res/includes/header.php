<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="<?php echo base_url(); ?>"><img src="<?php echo base_url('res/'); ?>imgs/LearnITLogo.png" alt="LOGO"></a>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a href="" class="dropdown-toggle" data-toggle="dropdown"><b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="<?php echo base_url('courses/category/android') ?>">Lập trình android</a></li>
						<li><a href="<?php echo base_url('courses/category/c') ?>">Lập trình C++</a></li>
						<li><a href="<?php echo base_url('courses/category/c#') ?>">Lập trình C#.Net</a></li>
						<li><a href="<?php echo base_url('courses/category/java') ?>">Lập trình Java</a></li>
						<li><a href="<?php echo base_url('courses/category/pttk') ?>">Phân tích thiết kế</a></li>
						<li><a href="<?php echo base_url('courses/category/python') ?>">Lập trình Python</a></li>
						<li><a href="<?php echo base_url('courses/category/thvp') ?>">Tin học văn phòng</a></li>
					</ul>
				</li>
			</ul>
			<div class="navbar-form navbar-left">
				<form action="<?php echo base_url('courses'); ?>" method="POST" role="search">
					<div class="form-group">
						<input type="text" class="form-control search" placeholder="Search" name="keyword" autocomplete="off">
					</div>
					<button type="submit" class="btn btn-default" name="search" value="search"><i class="glyphicon glyphicon-search"></i></button>
					<a href="<?php echo base_url('courses'); ?>"><button type="button" class="btn btn-default"><i class="glyphicon glyphicon-briefcase"></i>Tất Cả Khoá Học</button></a>
					<a href="<?php echo base_url('cart'); ?>">
						<button type="button" class="btn btn-default">
							<i class="glyphicon glyphicon-shopping-cart"></i>Giỏ Hàng
						</button>
					</a>
				</form>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li class="account">
					<a href="<?php echo base_url('auth'); ?>" id="login-button">
						<i class="fa fa-user-circle-o"></i>
						<?php
							if (isset($_SESSION['name_user'])) {
								echo $_SESSION['name_user'];
							}
							else echo "Tài khoản";	 
						?>
					</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
<br><br>