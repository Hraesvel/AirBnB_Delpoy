plan webserver::task3 (
  TargetSpec $nodes,
  String $prj_path = '/mnt/c/Users/msmit/work/Deploy_Airbnb',
  String $dest_path = '/home/ubuntu',
  String $nginx = '/etc/nginx',
  String $server_config = '3-app_server-nginx_config',
  Boolean $as_plan = false,
  Boolean $skip_upload = false,
) {
  if !$as_plan {
    run_command("pkill -f gunicorn", $nodes, _catch_errors => true)
    run_command("pkill -f gunicorn", $nodes, _catch_errors => true, _run_as => root)
  }

  if !$skip_upload {
    run_plan('webserver::airbnb_config', nodes=> $nodes, as_plan => true, skip_upload => $skip_upload)
    upload_file("$prj_path/$server_config", "$nginx/sites-available/airbnb", $nodes, _run_as => root)
  }

  run_command("cd ~/AirBnB_clone_v2 && gunicorn -D --bind 0:5001 web_flask.6-number_odd_or_even:app", $nodes)

  if !$as_plan{
    run_task ('webserver::nginx_config', $nodes, '_run_as' => 'root')
}
}