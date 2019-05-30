plan webserver::config (
  TargetSpec $nodes,
  String $filename = 'AirBnB_clone_v2.tgz',
  String $prj_path = '/mnt/c/Users/msmit/work/Deploy_Airbnb/',
  String $dest_path = '/home/ubuntu/',
) {
  run_task ('webserver::apt_deps', $nodes, _run_as => root)
  run_task ('webserver::py_deps', $nodes, _run_as => root)
  run_task('webserver::install_node', $nodes, '_catch_errors' => true)
  upload_file(
    "$prj_path$filename",
    "$dest_path$filename",
    $nodes
  )
  run_task('webserver::airbnb_config', $nodes)
  run_task (
    'webserver::nginx_config',
    $nodes,
  '_run_as' => 'root'
  )
}