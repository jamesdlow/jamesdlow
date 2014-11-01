<?php

class MyDatabase
{
	function __construct($dbhost, $dbuser, $dbpass, $dbname) {
		$this->dbhost = $dbhost;
		$this->dbuser = $dbuser;
		$this->dbpass = $dbpass;
		$this->dbname = $dbname;
		$this->connect();
	}

	function __destruct() {
		$this->close();
	}

	function connect() {
		//CLIENT_MULTI_RESULTS = 131072
		$this->conn = mysql_connect($this->dbhost, $this->dbuser, $this->dbpass, 1, 131072);
		mysql_select_db($this->dbname, $this->conn);
	}

	function close() {
		//Doesn't work for PHP 4
		//try {
			mysql_close($this->conn);
		//} catch(Exception $e) {
		//}
	}

	function query($q, $repeat = 0) {
		$result = mysql_query($q, $this->conn);
		if (!$result) {
			if ($repeat > 0) {
				//2013 = Lost connection to MySQL server during query
				if (mysql_errno() == 2013 || mysql_errno() == 2014) {
					$this->connect();
					return $this->query($q, $repeat - 1);
				}
			} else {
				die("Invalid query -- $q -- " . mysql_error());
			}
		}
		$this->log($q,3);
		return $result;
	}
	
	function log($msg,$level) {
		global $log;
		if (isset($log)) {
			$log->log($msg,$level);
		}
	}
	
	function dump($msg,$level) {
		global $log;
		if (isset($log)) {
			$log->dump($msg,$level);
		}
	}

	function queryArray($q, $repeat = 1) {
		return $this->returnArray($this->query($q),$repeat);
	}
	function queryRow($q) {
		return $this->returnRow($this->query($q));
	}
	function queryValue($q) {
		return $this->returnValue($this->queryRow($q));
	}
	function queryCol($q, $col = 0) {
		return $this->returnCol($this->query($q), $col);
	}

	function callProc($proc, $params) {
		$paramstr = '';
		foreach($params as $param) {
			if ($paramstr != '') {
				$paramstr .= ',';
			}
			if (is_string($param)) {
				$paramstr .= "'" . mysql_real_escape_string($param) . "'";
			} else if(!isset($param)) {
				$paramstr .= 'null';
			} else {
				$paramstr .= $param;
			}
		}
		return $this->query("call $proc ($paramstr)",1);
	}

	function callProcArray($proc, $params) {
		return $this->returnArray($this->callProc($proc,$params));
	}
	function callProcRow($proc, $params) {
		return $this->returnRow($this->callProc($proc, $params));
	}
	function callProcValue($proc, $params) {
		return $this->returnValue($this->callProcRow($proc, $params));
	}
	function callProcCol($proc, $params, $col = 0) {
		return $this->returnCol($this->callProc($proc, $params), $col);
	}
	
	function returnValue($row) {
		foreach ($row as $col) {
			return $col;
		}
	}
	function returnRow($results) {
		return mysql_fetch_assoc($results);
	}
	function returnArray($results) {
		$array = array();
		while ($row = mysql_fetch_assoc($results)) {
			$array[] = $row;
		}
		return $array;
	}
	function returnCol($results, $col = 0) {
		$array = array();
		while ($row = mysql_fetch_assoc($results)) {
			$i = 0;
			foreach ($row as $value) {
				if ($i == $col) {
					$array[] = $value;
				}
				$i++;
			}
		}
		return $array;
	}
}

function mysql_bit($bit) {
	//There is a special non-displayable character inside what appears to be just a space
	//return $bit == '';
	return ord($bit) == 1;
}
?>