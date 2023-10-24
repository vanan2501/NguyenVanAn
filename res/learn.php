<!DOCTYPE html>	
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content='Học trực tuyến cùng với những Giảng viên hàng đầu. Học online 24/7 - Tự tin làm chủ tương lai. Siêu thị bài giảng trực tuyến lớn nhất Việt Nam' name='description'>
	<link rel="shortcut icon" type="image/x-icon" href="<?php echo base_url('res/'); ?>imgs/icon1.png">
	<title>Học trực tuyến - LearnITOnline</title>
	<link rel="stylesheet" href="<?php echo base_url('res/'); ?>bs/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?php echo base_url('res/'); ?>awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<?php echo base_url('res/'); ?>css/webstyle.css">
	<link rel="stylesheet" href="<?php echo base_url('res/'); ?>css/learn.css">
</head>
<body>
	<header>
		<?php include "includes/header.php" ?>
	</header>
	<main>
		<div class="container">
			<div class="row">
				<?php foreach ($course as $key => $value) {
				?>
				<h2><?php echo $value['ten_cs'] ?></h2>
				<p><?php echo $value['info_cs'] ?></p>
				<div class="col-md-8">
					<?php foreach ($link_episode as $col => $row) { 
					?>
					<h4><?php echo 'Bài '.$row['ep_number'].': '.$row['ep_title']; ?></h4>
					<span class="thumbnail">
						<video width="740" height="398" controls autoplay controlsList="nodownload">
							<source src="<?php echo base_url('res/uploads/').$row['video_name']; ?>" type="video/mp4">
						</video>
					</span>
					<div class="info-author">
						<p>Giảng Viên: <b><?php echo $value['name_user'] ?></b></p>
					</div>
					<?php } ?>
				</div>
				<?php } ?>
				<div class="col-md-4">
					<br><br>
					<div class="panel-group" id="accordion">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
										Bình luận
									</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="panel-body">
									<div class="overflow">
										<?php foreach ($comment as $key => $value) {
											?>
											<div class="hiencmt">
												<p class="infocmt">[<?php echo $value['ten_cmt'] ?> | <?php echo $value['email_cmt'] ?>]</p>
												<p class="ndcmt">Nội dung: <?php echo $value['nd_cmt'] ?></p>
											</div>
										<?php } ?>
									</div>
									<br><br>
									<form action="" method="POST" role="form">
										<input type="hidden" name="txtname" value="<?php echo $_SESSION['name_user'] ?>">
										<input type="hidden" name="txtemail" value="<?php echo $_SESSION['email_user'] ?>">
										<textarea name="txtnd" class="form-control" placeholder="Nội dung (Không quá 200 ký tự)" rows="3" maxlength="200"></textarea>
										<br>
										<button type="submit" class="btn btn-default" name="comment" value="submit">Bình luận</button>
									</form>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
										Tài liệu
									</a>
									
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="overflow">
										
									</div>
									
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
										Lộ trình - Bài học
									</a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="overflow" style="height: 300px;">
										<ul>
											<?php $i=0; foreach ($all_episodes as $key => $value) { $i++;
												?>	
												<li><a href="?episode=<?php echo $value['ep_number']; ?>"><button type="button" class="btn btn-default <?php if (isset($_GET['episode'])){if ($value['ep_number'] == $_GET['episode']) { echo 'active'; }} ?>" style="width: 100%; border: none;     text-align: left;"><b>Bài <?php echo $i.'</b> - '.$value['ep_title']; ?></button></a></li>
											<?php } ?>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer>
		<?php include "includes/footer.php" ?>
	</footer>
	<!-- Script -->
	<script src="<?php echo base_url('res/'); ?>bs/js/jquery.js"></script>
	<script src="<?php echo base_url('res/'); ?>bs/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$(this).bind("contextmenu", function(e) {
				return false;
			});
			$(this).keydown(function(event) {
				if (event.keyCode == 123 || (event.ctrlKey && event.keyCode == 85) || (event.ctrlKey && event.shiftKey && event.keyCode == 73)) {
					alert('Disabled');
					return false;
				}
				else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) {
					alert('Disabled');
					return false;
				}
			});
		});
	</script> 
</body>
</html>