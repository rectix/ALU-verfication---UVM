class alu_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(alu_scoreboard);
  uvm_analysis_imp#(alu_sequence_item, alu_scoreboard)  scoreboard_port;
  alu_sequence_item transactions[$];
  
  function new(string name = "alu_scoreboard", uvm_component parent);
    super.new(name, parent);
    
    `uvm_info("SCOREBOARD_CLASS", "CONSTRUCT SCOREBOARD CLASS", UVM_HIGH);
    
  endfunction;

  /*BUILD PHASE */
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCOREBOARD_CLASS", "SCOREBOARD BUILD PHASE ", UVM_HIGH);
    scoreboard_port = new("scoreborad_port", this);
    
  endfunction: build_phase;
  /*END BUILD PHASE */

  /*CONNECT PHASE */
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCOREBOARD_CLASS", "SCOREBOARD CONNECT PHASE ", UVM_HIGH);
  endfunction: connect_phase;
  /*END CONNECT PHASE */
  
  //--------------------------------------------------------
  // write function 
  //--------------------------------------------------------
  
  
  function void write(alu_sequence_item item);
    transactions.push_back(item);
    
  endfunction:write
  
  
  
  

  /*RUN PHASE */
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCOREBOARD_CLASS", "SCOREBOARD RUN PHASE ", UVM_HIGH)
     
    forever begin 
    
    //get the packet
    alu_sequence_item current_transaction;
    wait ((transactions.size() !=0));
    current_transaction = transactions.pop_front();    
    //generate the expected values
    //compare the withhe actual values
    compare(current_transaction);
      
    end 
    
    
  endtask: run_phase;
  /* END RUN PHASE */
  
  task compare(alu_sequence_item item);
    logic [7:0] expected;
    logic [7:0] actual;
    
    case(item.opcode) 
      0: begin
        expected = item.A + item.B;
      end
      
      1: begin
        expected = item.A - item.B;
      end
      
      2: begin
        expected = item.A * item.B;
      end
      
      3: begin
        expected = item.A / item.B;
      end
      
   endcase;
    actual  = item.result;
    
    if(expected != actual)
      begin
        `uvm_error("COMPARE", $sformatf("transaction failed ! actual : %d  expected : %d", actual, expected))
       
      end
    
    else begin
      `uvm_info("COMPARE", $sformatf("transaction Passed ! actual : %d  expected : %d", actual, expected), UVM_LOW)
       
      end
    
  endtask:compare
  
  
  
  
  
endclass: alu_scoreboard
