class alu_base_sequence extends uvm_sequence;
    `uvm_object_utils(alu_base_sequence);

     alu_sequence_item  reset_packet;

    function new (string name = "alu base sequence");
      super.new(name);
        `uvm_info("ALU_BASE_SEQUENCE", "CONSTRUCT ALU BASE SEQUENCE", UVM_HIGH)
        
    endfunction
  
  
    task body();
        `uvm_info("ALU_BASE_SEQUENCE", "ALU BASE SEQUENCE BODY", UVM_HIGH)
		reset_packet = alu_sequence_item::type_id::create("alu reset packet");
  
      
      repeat(1)
    begin
      
      start_item(reset_packet);
      reset_packet.randomize() with {reset == 1;};
      finish_item(reset_packet);

    end


    endtask
    
endclass: alu_base_sequence

//------------------------------------------------------------------------
class alu_test_sequence extends uvm_sequence;
    `uvm_object_utils(alu_test_sequence);

     alu_sequence_item item;

  function new (string name = "alu test sequence");
      super.new(name);
      `uvm_info("ALU_TEST_SEQUENCE", "CONSTRUCT ALU TEST SEQUENCE", UVM_HIGH)
        
    endfunction

    task body();
      `uvm_info("ALU_TEST_SEQUENCE", "ALU TEST SEQUENCE BODY", UVM_HIGH)
        
      item = alu_sequence_item::type_id::create("alu test sequence");
      repeat(1)
    begin
        start_item(item);
        item.randomize() with {reset==0;};
        finish_item(item);
      

    end


    endtask
    
endclass: alu_test_sequence