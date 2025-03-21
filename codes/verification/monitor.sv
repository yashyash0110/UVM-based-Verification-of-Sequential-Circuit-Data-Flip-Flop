//Monitor Class
class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  packet pkt;
  virtual dff_intf dif;
  
  uvm_analysis_port #(packet) mon_port;
  
  function new(string name = "monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dff_intf)::get(this,"","dif",dif))
      `uvm_error(get_type_name(),"Unable to access Interface")
    else
      `uvm_info(get_type_name(),"Successfully got access to Interface",UVM_MEDIUM)
    
    mon_port = new("Monitor Port",this);
    pkt = packet::type_id::create("pkt",this);
  
  endfunction
    
  virtual task run_phase(uvm_phase phase);
    forever begin
      repeat(2) @ (posedge dif.clk);
      pkt.reset = dif.reset;
      pkt.d = dif.d;
      pkt.q = dif.q;
      `uvm_info(get_type_name(),$sformatf("reset:%d d:%d q:%d",pkt.reset,pkt.d,pkt.q),UVM_MEDIUM);
      mon_port.write(pkt);
    end
  endtask
  
endclass
