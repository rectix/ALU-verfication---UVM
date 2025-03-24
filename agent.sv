class alu_agent extends uvm_agent;
  `uvm_component_utils(alu_agent);
  alu_sequencer seq;
  alu_monitor mon;
  alu_driver drv;
 
 
  
  function new(string name = "alu_agent", uvm_component parent);
    super.new(name, parent);
    
    `uvm_info("AGENT_CLASS", "CONSTRUCT AGENT CLASS", UVM_HIGH);
    
  endfunction;

  /*BUILD PHASE */
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT_CLASS", "AGENT BUILD PHASE ", UVM_HIGH);
    
    seq  = alu_sequencer::type_id::create("SEQUENCER", this);
    drv  = alu_driver::type_id::create("DRIVER", this);
    mon  = alu_monitor::type_id::create("MONITOR", this);
    
    
  endfunction: build_phase;
  /*END BUILD PHASE */

  /*CONNECT PHASE */
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT_CLASS", "AGENT CONNECT PHASE ", UVM_HIGH);
    
    drv.seq_item_port.connect(seq.seq_item_export);
    
   
    
    
    
  endfunction: connect_phase;
  /*END CONNECT PHASE */

  /*RUN PHASE */
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("AGENT_CLASS", "AGENT RUN PHASE ", UVM_HIGH);
  endtask: run_phase;
  /* END RUN PHASE */
  
endclass: alu_agent


