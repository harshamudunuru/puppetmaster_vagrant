# -*- mode: puppet -*-
# vi: set ft=puppet :

node 'windows7' {

  # NOTE: the spoon selenium grid command will fail unless spoon provisioner is not being on the box
  $spoon_command = 'run base,spoonbrew/selenium-grid'
  $run_command = "'C:\\Program Files\\Spoon\\Cmd\\spoon.exe' ${spoon_command}"

  custom_command { 'Launch nodepad':
    command => 'notepad.exe',
    script  => 'launch_notepad',
    wait    => true,
  }

exec_service_control {'aspnet_state': }
exec_service_control {'AxInstSV': }
exec_directory{ 'C:\Program Files\Spoon\Cmd':}
exec_path_environment{ 'C:\Program Files\Spoon\Cmd':}
#  custom_command { 'Run spoon selenium grid':
#    command => $run_command,
#    script  => 'launch_spoon',
#    wait    => true,
#  }
#  Custom_command['Launch nodepad'] -> Custom_command['Run spoon selenium grid'] 
}
