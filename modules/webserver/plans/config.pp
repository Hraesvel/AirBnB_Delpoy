plan webserver::config (
  TargetSpec $nodes,
  String $filename = '/mnt/c/Users/msmit/work/Deploy_Airbnb/AirBnB_clone_v2.tgz'
) {
  run_task ('webserver::deps', $nodes, _run_as => root)
  run_task ('webserver::pip_pack', $nodes, _run_as => root)
  run_task('webserver::install_node', $nodes, '_catch_errors' => true)
  upload_file($filename, '/home/ubuntu/AirBnB_clone_v2.tgz', $nodes,)
  run_command("tar -xf AirBnB_clone_v2.tgz", $nodes)
  run_command("pip3 install gunicorn", $nodes, _run_as => root)

  run_command("cd AirBnB_clone_v2 && gunicorn -D --bind 0.0.0.0:5000 web_flask.0-hello_route:app", $nodes)
  run_task (
    'webserver::nginx_config',
    $nodes,
  '_run_as' => 'root'
  )
}