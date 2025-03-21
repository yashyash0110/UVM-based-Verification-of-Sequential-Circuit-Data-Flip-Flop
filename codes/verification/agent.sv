class config_dff extends uvm_object;
  `uvm_object_utils(config_dff)

  uvm_active_passive_enum agent_type = UVM_ACTIVE;

  function new(string name = "config_dff");
    super.new(name);
  endfunction
endclass

//Agent Class
class agent extends uvm_agent;
  `uvm_component_utils(agent)
  
  sequencer seqr;
  driver drv;
  monitor mon;
  
  config_dff cfg;
  
  function new(string name = "agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    mon = monitor::type_id::create("mon",this);  
    
    cfg = config_dff::type_id::create("cfg",this);
    
    if(!uvm_config_db#(config_dff)::get(this,"","cfg",cfg))
      `uvm_error(get_type_name(),"Failed to access config")
    
    if(cfg.agent_type == UVM_ACTIVE)
      begin
        drv = driver::type_id::create("drv",this);
        seqr = sequencer::type_id::create("seqr",this);
        `uvm_info(get_type_name(),"Successfully got access to config",UVM_MEDIUM)
      end
    
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
endclass
