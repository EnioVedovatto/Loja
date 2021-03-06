<?php
	//Constantes
	$configs = new HXPHP\System\Configs\Config;

		$configs->env->add('development');

		$configs->env->development->baseURI = '/loja/';

		$configs->env->development->database->setConnectionData(array(
			'driver' => 'mysql',
			'host' => 'localhost',
			'user' => 'root',
			'password' => '',
			'dbname' => 'db_loja'
		));

		$configs->env->development->auth->setURLs('/loja/home/', '/loja/login/');

	return $configs;
