//Transaction or Packet or sequence item Class
class packet extends uvm_sequence_item;
  `uvm_object_utils(packet)
  
  rand bit reset;
  rand bit d;
  bit q;
  
  function new(input string name = "packet");
    super.new(name);
  endfunction
  
endclass
