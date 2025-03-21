class valid_d extends uvm_sequence#(packet); //rst = 0
  `uvm_object_utils(valid_d)
  
  packet pkt;
  
  function new(input string name = "valid_d");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(15)
      begin
        pkt = packet::type_id::create("pkt");
        start_item(pkt);
        pkt.randomize();
        pkt.reset = 1'b0;
        `uvm_info(get_type_name(),$sformatf("reset:%d d:%d q:%d",pkt.reset,pkt.d,pkt.q),UVM_MEDIUM);
        finish_item(pkt);
      end
  endtask
  
endclass

///////////////////////////////////////////////////////////

class reset_dff extends uvm_sequence#(packet); //rst = 1
  `uvm_object_utils(reset_dff)
  
  packet pkt;
  
  function new(input string name = "reset_dff");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(15)
      begin
        pkt = packet::type_id::create("pkt");
        start_item(pkt);
        pkt.randomize();
        pkt.reset = 1'b1;
        `uvm_info(get_type_name(),$sformatf("reset: %d d:%d q:%d",pkt.reset,pkt.d,pkt.q),UVM_MEDIUM);
        finish_item(pkt);
      end
  endtask
  
endclass

///////////////////////////////////////////////////////////

class rand_d_reset extends uvm_sequence#(packet); //random d and reset
  `uvm_object_utils(rand_d_reset)
  
  packet pkt;
  
  function new(input string name = "rand_d_reset");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(15)
      begin
        pkt = packet::type_id::create("pkt");
        start_item(pkt);
        pkt.randomize();
        `uvm_info(get_type_name(),$sformatf("reset: %d d:%d q:%d",pkt.reset,pkt.d,pkt.q),UVM_MEDIUM);
        finish_item(pkt);
      end
  endtask
  
endclass
