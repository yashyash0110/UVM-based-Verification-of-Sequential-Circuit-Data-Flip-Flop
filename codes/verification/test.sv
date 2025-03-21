//Test Class
class test extends uvm_test;
  `uvm_component_utils(test)
  
  env envmt;
  
  valid_d vd;
  reset_dff rff;
  rand_d_reset rdr;
  
  function new(string name = "test",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    envmt = env::type_id::create("envmt",this);
    vd = valid_d::type_id::create("vd" );
    rff = reset_dff::type_id::create("rff" );
    rdr = rand_d_reset::type_id::create("rdr");
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    rff.start(envmt.agnt.seqr);
    #40;
    vd.start(envmt.agnt.seqr);
    #40;
    rdr.start(envmt.agnt.seqr);
    #40;
    phase.drop_objection(this);
  endtask
  
endclass
