//Scoreboard Class
class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  uvm_analysis_imp#(packet,scoreboard) recv;
  
  function new(string name = "scoreboard",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    recv = new("Receiver Port",this);
  endfunction
  
  virtual function void write(packet pkt);
    `uvm_info(get_type_name(),$sformatf("reset:%d d:%d q:%d",pkt.reset,pkt.d,pkt.q),UVM_MEDIUM)
    if(pkt.reset == 1'b1)
      `uvm_info(get_type_name(),"DFF Reset",UVM_MEDIUM)
      else if(pkt.reset == 1'b0 && (pkt.d == pkt.q))
        `uvm_info(get_type_name(),"Test Passed",UVM_MEDIUM)
    else
      `uvm_error(get_type_name(),"Test Failed")      
    $display("---------------------------------------------------");
  endfunction
  
endclass
