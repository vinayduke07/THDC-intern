<!DOCTYPE html>
<html>
<head>
	<title><?php echo $title; ?></title>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<link rel="icon" href="<?=base_url('assets/images/favicon.ico'); ?>">

	<?=link_tag(base_url('assets/css/bootstrap.min.css'));?>
	<?=link_tag(base_url('assets/css/datatables.min.css'));?>
	<?=link_tag(base_url('assets/css/css-style.css'));?>

	<script type="text/javascript" src="<?=base_url();?>assets/js/jquery-2.2.0.min.js"></script>
	<script type="text/javascript" src="<?=base_url();?>assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<?=base_url();?>assets/js/datatables.min.js"></script>

</head>
<body>
<?php if(strcmp($viewuser,'admin') != 0):?>
	<div class="top">
	<img src="<?=base_url('assets/images/logo2.png'); ?>" width="7%">
	<h2 style="display:inline">Complaint Management Portal</h2>
	</div>
<?php endif;?>
<header>
	<nav class = "navbar navbar-default" >
		<div class = "container-fluid">
			<div class = "navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse" aria-expanded="false">
					<span class="sr-only">Toggle Navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<?=base_url(); ?>">
					<?php if(strcmp($viewuser,'admin') == 0):?>
						Dash Board
					<?php else: ?>
						THDC Complaint Portal
					<?php endif;?>
				</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse">
				<ul class="nav navbar-nav ">
				<?php	if(strcmp($viewuser,'public') == 0): ?>
						<li role = "presentation" ><a href = "<?=base_url(); ?>" <?php if($title=='Home'){ echo "class='active'"; }?> ><span class = "glyphicon glyphicon-home">	</span> Home</a></li>
						<?php if(!$islogin):?>
							<li role = "presentation" ><a href = "<?=base_url('register'); ?>" <?php if($title=='Register'){ echo "class='active'"; }?>  ><span class = "glyphicon glyphicon-user">	</span> Register</a></li>
							<li role = "presentation" ><a href = "<?=base_url('login'); ?>" <?php if($title=='Login'){ echo "class='active'"; }?>  ><span class = "glyphicon glyphicon-log-in" > </span> Login</a></li>
						<?php else: ?>
							<li role = "presentation" ><a href = "<?=base_url('complaintregister'); ?>" <?php if($title=='Complaintregister'){ echo "class='active'"; }?> ><span class = "glyphicon glyphicon-plus">	</span> Complaint Register</a></li>
							<li role = "presentation" ><a href = "<?=base_url('complaints'); ?>" <?php if($title=='Complaints'){ echo "class='active'"; }?> ><span class = "glyphicon glyphicon-list-alt">	</span> Complaints By You</a></li>
						<?php endif; ?>
				<?php 	elseif(strcmp($viewuser,'admin') == 0): ?>
						<li role = "presentation" ><a href = "<?=base_url('admin/adminhome'); ?>" <?php if($title=='Adminhome'){ echo "class='active'"; }?> ><span class = "glyphicon glyphicon-home">	</span> Home</a></li>
						<?php if($islogin):?>
							<li role = "presentation" ><a href = "<?=base_url('admin/worker'); ?>" <?php if($title=='Worker'){ echo "class='active'"; }?> ><span class = "glyphicon glyphicon-user">	</span> Worker</a></li>
							<li role = "presentation" ><a href = "<?=base_url('admin/category'); ?>" <?php if($title=='Category'){ echo "class='active'"; }?> ><span class = "glyphicon glyphicon-list-alt">	</span> Category</a></li>
							<li role = "presentation" ><a href = "<?=base_url('admin/reports'); ?>" <?php if($title=='Reports'){ echo "class='active'"; }?> ><span class = "glyphicon glyphicon-file">	</span> Reports</a></li>
						<?php endif; ?>
			<?php 	elseif(strcmp($viewuser,'worker') == 0): ?>
						<?php if($islogin):?>
								<li role = "presentation" ><a href = "<?=base_url('worker/home'); ?>" <?php if($title=='Home'){ echo "class='active'"; }?> ><span class = "glyphicon glyphicon-home">	</span> Home</a></li>
						<?php endif; ?>
			<?php endif ?>
					</ul>
				<?php if($islogin):?>
					<ul class="nav navbar-nav" style="float:right;">
						<?php if(strcmp($viewuser,'admin') == 0 || strcmp($viewuser,'worker') == 0): ?>
							<li role = "presentation" ><a href = "<?=base_url('Login/logout'); ?>" ><span class = "glyphicon glyphicon-log-out">	</span> Logout</a></li>
						<?php else: ?>
							<li role = "presentation" ><a href = "<?=base_url('userprofile'); ?>" <?php if($title=='userprofile'){ echo "class='active'"; }?> ><span class = "glyphicon glyphicon-user">	</span> <?=substr($uinfo[0]->full_name,0,strpos($uinfo[0]->full_name,' ')); ?></a></li>
							<li role = "presentation" ><a href = "<?=base_url('Login/logout'); ?>" ><span class = "glyphicon glyphicon-log-out">	</span> Logout</a></li>
						<?php endif; ?>
					</ul>
				<?php endif;	?>

				</ul>
			</div>

		</div>
	</nav>
</header>
<div class="container-fluid container-main">
