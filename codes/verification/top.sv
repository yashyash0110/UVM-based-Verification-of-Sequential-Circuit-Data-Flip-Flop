//Top Module
`include "uvm_macros.svh" 
import uvm_pkg::*;

`include "packet.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "env.sv"
`include "test.sv"

`include "interface.sv"

module top;
  
  dff_intf dif();
  
  dff dut(.clk(dif.clk),.reset(dif.reset),.d(dif.d),.q(dif.q));
  
  initial begin
    uvm_config_db#(virtual dff_intf)::set(null,"*","dif",dif);
  end
  
  //Clock Generation
  initial begin
    dif.clk = 1'b0;
    forever #10 dif.clk = ~ dif.clk;
  end
  
  initial begin
    run_test("test");
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule
