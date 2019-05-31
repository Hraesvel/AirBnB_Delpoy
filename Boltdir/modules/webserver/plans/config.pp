plan webserver::config (
  TargetSpec $nodes,
  String $filename = 'AirBnB_clone_v2.tgz',
  String $prj_path = '/mnt/c/Users/msmit/work/Deploy_Airbnb',
  String $dest_path = '/home/ubuntu',
  String $nginx = '/etc/nginx',
  String $server_config = '2-app_server-nginx_config',
  Boolean $skip_upload = false,
  Boolean $skip_deps = false
) {
  if !$skip_deps {
    run_task ('webserver::apt_deps', $nodes, _run_as => root)
    run_task ('webserver::py_deps', $nodes, _run_as => root)
    run_task('webserver::install_node', $nodes, '_catch_errors' => true)
    upload_file(
      "$prj_path/$filename",
      "$dest_path/$filename",
      $nodes
    )
  }
  run_plan('webserver::add_dump', nodes => $nodes)

  run_command("pkill -f gunicorn", $nodes, _catch_errors => true)
  run_command("pkill -f gunicorn", $nodes, _catch_errors => true, _run_as => root)
  run_plan('webserver::airbnb_config',  nodes => $nodes, as_plan => true, skip_upload => $skip_upload)
  run_plan('webserver::task3', nodes => $nodes, as_plan => true, skip_upload => $skip_upload)
  run_plan('webserver::task4', nodes => $nodes, as_plan => true, skip_upload => $skip_upload)
  run_plan('webserver::task5', nodes => $nodes, as_plan => true, skip_upload => false)

  #   add dump file to server

  run_task ( 'webserver::nginx_config', $nodes, '_run_as' => 'root' )
}