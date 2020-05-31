
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name TrafficController -dir "T:/cgz215/TrafficController/planAhead_run_2" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "T:/cgz215/TrafficController/TrafficLightController.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {T:/cgz215/TrafficController} }
set_property target_constrs_file "Trafficlight_const.ucf" [current_fileset -constrset]
add_files [list {Trafficlight_const.ucf}] -fileset [get_property constrset [current_run]]
link_design
