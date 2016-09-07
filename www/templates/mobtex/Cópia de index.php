<?php defined( '_VALID_MOS' ) or die( 'Direct Access to this location is not allowed.' ); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="<?php echo _LANGUAGE; ?>" xml:lang="<?php echo _LANGUAGE; ?>"
	<head>
		<meta http-equiv="Content-Type" content="text/html; <?php echo _ISO; ?>" />
		<?php
		if ($my->id) { initEditor(); } ?>
		<?php mosShowHead(); ?>
		<script type="text/javascript"></script>
		<link href="templates/<?php echo $cur_template; ?>/css/template_css.css" rel="stylesheet" type="text/css" media="screen" />
	</head>
	<body>
		<div id="wrap">
			<div id="header">
				<img id="logo" src="templates/<?php echo $cur_template; ?>/images/logo.png" />
			</div>
			
			<div id="leftbar">
				<div id="lateralLeftBar"></div>
				<div id="lateralLeftContent">
					<?php mosLoadModules('left');?>
				</div>
			</div>
			
			<div id="content">
			<?php mosLoadModules('top');?><?php echo $mosConfig_sitename; ?> <?php mospathway() ?> <?php mosMainBody(); ?>
			</div>
			
			<div id="footer">
			<?php mosLoadModules('footer');?>
			</div>
		</div>
	</body>
</html>