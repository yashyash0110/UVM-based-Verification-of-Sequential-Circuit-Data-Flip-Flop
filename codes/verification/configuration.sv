//Configuration Class
class config_dff extends uvm_object;
     `uvm_object_utils(config_dff)
  
  	  uvm_active_passive_enum agent_type = UVM_ACTIVE;
  
      function new(string name = "config_dff");
        super.new(name);
      endfunction
endclass
