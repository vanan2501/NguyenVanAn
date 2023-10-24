<h1>Dashboard</h1>
<hr>
<div class="row">
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-book fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge"><?php echo $dashboard_count['course']; ?></div>
						<div>Khóa học!</div>
					</div>
				</div>
			</div>
			<a href="<?php echo base_url('admin_panel/qlkh') ?>">
				<div class="panel-footer">
					<span class="pull-left">Xem chi tiết</span>
					<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-green">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-comments fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge"><?php echo $dashboard_count['comment']; ?></div>
						<div>Bình luận!</div>
					</div>
				</div>
			</div>
			<a href="<?php echo base_url('admin_panel/qlbl') ?>">
				<div class="panel-footer">
					<span class="pull-left">Xem chi tiết</span>
					<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-yellow">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-shopping-cart fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge"><?php echo $dashboard_count['own']; ?></div>
						<div>Đơn hàng!</div>
					</div>
				</div>
			</div>
			<a href="<?php echo base_url('admin_panel/qldh') ?>">
				<div class="panel-footer">
					<span class="pull-left">Xem chi tiết</span>
					<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-red">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa fa-user fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge"><?php echo $dashboard_count['user']; ?></div>
						<div>Thành viên!</div>
					</div>
				</div>
			</div>
			<a href="<?php echo base_url('admin_panel/qltv') ?>">
				<div class="panel-footer">
					<span class="pull-left">Xem chi tiết</span>
					<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
		<!-- <div class="panel panel-default" id="#Area-Chart">
			<div class="panel-heading">
				<i class="fa fa-bar-chart-o fa-fw"></i> Area Chart Example
				<div class="pull-right">
					<div class="btn-group">
						<a href=""><button type="button" class="btn btn-default btn-xs">Refresh</button></a>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div id="morris-area-chart"></div>
			</div>
		</div> -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-bell fa-fw"></i> Administrator Chats
				<div class="pull-right">
					<div class="btn-group">
						<a href=""><button type="button" class="btn btn-default btn-xs">Refresh</button></a>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<ul class="chat">
					<?php 
					$i = 0;
					foreach ($admin_chat as $key => $value) {
						$i++;
						if ($i % 2 == 0) {
							echo '<li class="right clearfix">';
							echo '<span class="chat-img pull-right">';
							echo '<img src="'.base_url("res/uploads/").$value["avatar_user"].'" alt="User Avatar" class="img-circle" width="50px">';
							echo '</span>';
							echo '<div class="chat-body clearfix">';
							echo '<div class="header">';
							echo '<small class=" text-muted"><i class="fa fa-clock-o fa-fw"></i> '.$value["date_chat"].'</small>';
							echo '<strong class="pull-right primary-font">'.$value["name_user"].'</strong>';
							echo '</div>';
							echo '<p>'.$value["content_chat"].'</p>';
							echo '</div>';
							echo '</li>';

						}
						else{
							echo '<li class="left clearfix">';
							echo '<span class="chat-img pull-left">';
							echo '<img src="'.base_url("res/uploads/").$value["avatar_user"].'" alt="User Avatar" class="img-circle" width="50px">';
							echo '</span>';
							echo '<div class="chat-body clearfix">';
							echo '<div class="header">';
							echo '<strong class="primary-font">'.$value["name_user"].'</strong>';
							echo '<small class="pull-right text-muted"><i class="fa fa-clock-o fa-fw"></i> '.$value["date_chat"].'</small>';
							echo '</div>';
							echo '<p>'.$value["content_chat"].'</p>';
							echo '</div>';
							echo '</li>';
						}
					}
					?>
				</ul>
			</div>
			<div class="panel-footer">
				<form action="" method="POST" role="form">
					<div class="input-group">
						<textarea class="form-control input-sm" rows="1" name="content_chat" placeholder="Type your message here..."></textarea>
						<!-- <input type="text" class="form-control input-sm" name="content_chat" placeholder="Type your message here..."> -->
						<span class="input-group-btn">
							<button class="btn btn-warning btn-sm" type="submit" name="chat_admin" value="submit">
								Send <i class="fa fa-arrow-circle-right"></i>
							</button>
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-bell fa-fw"></i> Tin tức mới
				<div class="pull-right">
					<div class="btn-group">
						<a href=""><button type="button" class="btn btn-default btn-xs">Refresh</button></a>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div class="list-group">
					<a href="#" class="list-group-item">
						<i class="fa fa-book fa-fw"></i> Khóa học mới
						<span class="pull-right small"><em><?php if($newTime['courseTime']==0){echo "Hôm nay";} else{ echo $newTime['courseTime'].' ngày trước'; } ?></em>
						</span>
					</a>
					<a href="#" class="list-group-item">
						<i class="fa fa-user fa-fw"></i> Thành viên mới
						<span class="pull-right small"><em><?php if($newTime['userTime']==0){echo "Hôm nay";} else{ echo $newTime['userTime'].' ngày trước'; } ?></em>
						</span>
					</a>
					<a href="#" class="list-group-item">
						<i class="fa fa-shopping-cart fa-fw"></i> Lượt mua khóa học mới
						<span class="pull-right small"><em><?php if($newTime['ownTime']==0){echo "Hôm nay";} else{ echo $newTime['ownTime'].' ngày trước'; } ?></em>
						</span>
					</a>
					<a href="#" class="list-group-item">
						<i class="fa fa-comment fa-fw"></i> Bình luận mới
						<span class="pull-right small"><em><?php if($newTime['cmtTime']==0){echo "Hôm nay";} else{ echo $newTime['cmtTime'].' ngày trước'; } ?></em>
						</span>
					</a>
					<a href="#" class="list-group-item">
						<i class="fa fa-upload fa-fw"></i> Email Sent
						<span class="pull-right small"><em>32 email sent</em>
						</span>
					</a>
					<a href="#" class="list-group-item">
						<i class="fa fa-money fa-fw"></i> Payment Received
						<span class="pull-right small"><em><?php echo number_format($newTime['money']).' VNĐ' ?></em>
						</span>
					</a>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-bar-chart-o fa-fw"></i> Donut Chart Example
				<div class="pull-right">
					<div class="btn-group">
						<a href=""><button type="button" class="btn btn-default btn-xs">Refresh</button></a>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div id="morris-donut-chart"></div>
			</div>
		</div>
	</div>
</div>
