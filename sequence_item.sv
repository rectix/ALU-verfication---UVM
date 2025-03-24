class alu_sequence_item extends uvm_sequence_item;
  
  `uvm_object_utils(alu_sequence_item)
    //request_item
    logic reset;
    rand logic [7:0] A;
    rand logic [7:0] B;
    rand logic [3:0] opcode;

    //response_item
    logic [7:0] result;
    bit Carry;
  
  /*
   *design constraints
   */
  
  constraint input1_c {A inside {[10:20]};}
  constraint input2_c {B inside {[1:10]};}
  constraint op_code_c {opcode inside {0,1,2,3};}



  
  function new(string name = "alu_sequence_item");
    super.new(name);
  endfunction:new
endclass: alu_sequence_item