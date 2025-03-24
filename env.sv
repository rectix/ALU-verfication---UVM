class alu_env extends uvm_env;
  `uvm_component_utils(alu_env);
  alu_agent agent;
   alu_scoreboard scorebd;
  
  function new(string name = "alu_env", uvm_component parent);
    super.new(name, parent);
    
    `uvm_info("ENV_CLASS", "CONSTRUCT ENV CLASS", UVM_HIGH);
    
  endfunction;

  /*BUILD PHASE */
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV_CLASS", "ENV BUILD PHASE ", UVM_HIGH);
    agent  = alu_agent::type_id::create("AGENT", this);
    scorebd = alu_scoreboard::type_id::create("SCOREBOARD", this);
    
    
  endfunction: build_phase;

  /*END BUILD PHASE */
  

  /*CONNECT PHASE */
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV_CLASS", "ENV CONNECT PHASE ", UVM_HIGH);
    agent.mon.monitor_port.connect(scorebd.scoreboard_port);
    
    
    
  endfunction: connect_phase;
  /*END CONNECT PHASE */

  /*RUN PHASE */
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("ENV_CLASS", "ENV RUN PHASE ", UVM_HIGH);
  endtask: run_phase;
  /* END RUN PHASE */
  
endclass: alu_env
