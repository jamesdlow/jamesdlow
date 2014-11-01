<?php
function modiftytime($file) {
	//filectime
	//touch -t 200805101024 filename
	//echo '/Users/James/Downloads/Videos/'.basename($file,'.AVI').'.mp4'."\n";
	//echo filectime($file)."\n";
	//touch('/Users/James/Downloads/Videos/'.basename($file,'.AVI').'.mp4',filectime($file));
	//echo 'touch -r "'.$file.'" "'.'/Users/James/Downloads/Videos/'.basename($file,'.AVI').'.mp4'.'"'."\n";
	shell_exec('touch -r "'.$file.'" "'.'/Users/James/Downloads/Videos/'.basename($file,'.AVI').'.mp4'.'"');
}

?>