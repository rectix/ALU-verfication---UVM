class alu_sequencer extends uvm_sequencer#(alu_sequence_item);
  `uvm_component_utils(alu_sequencer);
  
  function new(string name = "alu_sequencer", uvm_component parent);
    super.new(name, parent);
    
    `uvm_info("SEQUENCER_CLASS", "CONSTRUCT SEQUENCER CLASS", UVM_HIGH);
    
  endfunction;

  /*BUILD PHASE */
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SEQUENCER_CLASS", "SEQUENCER BUILD PHASE ", UVM_HIGH);
  endfunction: build_phase;
  /*END BUILD PHASE */

  /*CONNECT PHASE */
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SEQUENCER_CLASS", "SEQUENCER CONNECT PHASE ", UVM_HIGH);
  endfunction: connect_phase;
  /*END CONNECT PHASE */

  /*RUN PHASE */
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SEQUENCER_CLASS", "SEQUENCER RUN PHASE ", UVM_HIGH);
  endtask: run_phase;
  /* END RUN PHASE */
  
endclass: alu_sequencer
