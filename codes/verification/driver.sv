//Driver Class
class driver extends uvm_driver#(packet);
  `uvm_component_utils(driver)
  
  packet pkt;
  virtual dff_intf dif;
  
  function new(string name = "driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dff_intf)::get(this,"","dif",dif))
      `uvm_error(get_type_name(),"Unable to access Interface")
    else
      `uvm_info(get_type_name(),"Successfully got access to Interface",UVM_MEDIUM)
    
    pkt = packet::type_id::create("pkt");
    
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(pkt);
      dif.reset <= pkt.reset;
      dif.d <= pkt.d;
	  `uvm_info(get_type_name(),$sformatf("reset:%d d:%d q:%d",pkt.reset,pkt.d,pkt.q),UVM_MEDIUM);
      seq_item_port.item_done();
      repeat(2) @ (posedge dif.clk);
    end
  endtask
  
endclass
