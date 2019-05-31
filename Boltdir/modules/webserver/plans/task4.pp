plan webserver::task4 (
  TargetSpec $nodes,
  String $filename = 'AirBnB_clone_v3', # modify for task 4
  String $prj_path = '/mnt/c/Users/msmit/work/Deploy_Airbnb',
  String $dest_path = '/home/ubuntu',
  String $nginx = '/etc/nginx',
  String $server_config = '4-app_server-nginx_config',
  Boolean $as_plan = false,
  Boolean $skip_upload = false,

) {
if !$as_plan {
  run_command("pkill -f gunicorn", $nodes, _catch_errors => true)
}

  #task 4
if !$skip_upload {
  upload_file("$prj_path/$filename.tgz", "$dest_path/$filename.tgz", $nodes)
  run_command("tar -xf $filename.tgz", $nodes)
  upload_file("$prj_path/$server_config", "$nginx/sites-available/airbnb", $nodes, _run_as => root)
}

  run_task("webserver::task4",  $nodes, filename => $filename)


  if !$as_plan {
    run_task ( 'webserver::nginx_config', $nodes, '_run_as' => 'root')
}
}