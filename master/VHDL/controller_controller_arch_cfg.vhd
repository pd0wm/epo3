configuration controller_controller_arch_cfg of controller is
   for controller_arch
      for all: controller_move use configuration work.controller_move_controller_move_arch_cfg;
      end for;
   end for;
end controller_controller_arch_cfg;


