<html>
<body>
<?php
//Config
$p = 'em_';	//prefix for variables in post request
$email = '@yahoo.com'; //email to send to
$subject = 'RSVP'; //subject if not specified in form as $p.'subject'
$bodystart = ''; //text before submitted items
$bodyend = ''; //text after submitted items

//Begin script
$submit = $_POST[$p.'submit'];
if ($submit) {
	$subject = ($_POST[$p.'subject'] ? $_POST[$p.'subject'] : $subject);
	//process form
	$body .= "$bodystart\r\n";
	foreach($_POST as $key => $value) {
		if (strpos($key, $p) === 0) {
			if ($key != $p.'submit') {
				$body .= substr($key, strlen($p)) . ": $value\r\n";
			}
		}
	}
	$body .= "$bodyend\r\n";
	if (mail($email, $subject, $body)) {
		echo("<p>Message successfully sent!</p>");
	} else {
		echo("<p>Message delivery failed...</p>");
	}
} else {
	//echo form
?>
	<form name="input" action="<?php echo $_SERVER["SCRIPT_NAME"]; ?>" method="post">
	Name: <input type="text" name="em_Name" />
	<br />Email: <input type="text" name="em_Email" />
	<br />Guests: <input type="text" name="em_Guests" />
	<br /><input type="submit" value="Submit" name="em_submit" />
	</form>
<?php } ?>
</body>
</html>
