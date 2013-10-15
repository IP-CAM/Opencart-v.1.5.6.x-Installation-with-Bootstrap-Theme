<?php
class Language {
	private $default = 'english';
	private $directory;
	private $data = array();
 
	public function __construct($directory) {
		$this->directory = $directory;
	}
	
	// вынес из load дабы не дублировать
  	private function _get_content($file) {
  		$_ = array();	
		require($file);	
		$this->data = array_merge($this->data, $_);		
		return $this->data;
  	}

  	public function get($key) {
   		return (isset($this->data[$key]) ? $this->data[$key] : $key);
  	}
	
	public function load($filename) {
		$file = DIR_LANGUAGE . $this->directory . '/' . $filename . '.php';
    	
		if (file_exists($file)) {
			return $this->_get_content($file);
		}
		
		$file = DIR_LANGUAGE . $this->default . '/' . $filename . '.php';
		
		if (file_exists($file)) {
			return $this->_get_content($file);
		} else {
			trigger_error('Error: Could not load language ' . $filename . '!');
		//	exit();
		}
  	}
}
?>
