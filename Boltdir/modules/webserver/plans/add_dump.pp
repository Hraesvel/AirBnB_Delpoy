plan webserver::add_dump (
  TargetSpec $nodes,
  String $prj_path = '/mnt/c/Users/msmit/work/Deploy_Airbnb',
  String $dest_path = '/home/ubuntu',
){
  upload_file(
    "$prj_path/100-dump.sql",
    "$dest_path/100-dump.sql",
    $nodes
  )
  run_command("cat 100-dump.sql | mysql -uroot -proot && rm 100-dump.sql", $nodes)
  run_command("cat AirBnB_clone_v2/setup_mysql_dev.sql | mysql -uroot -proot", $nodes)
}