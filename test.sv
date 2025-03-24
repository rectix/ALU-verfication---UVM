class alu_test extends uvm_test;
  `uvm_component_utils(alu_test);
  
  alu_env env;
  alu_base_sequence reset_seq;
   alu_test_sequence test_seq;
  function new(string name = "alu_test", uvm_component parent);
    super.new(name, parent);
    
    `uvm_info("TEST_CLASS", "CONSTRUCT TEST CLASS", UVM_HIGH);
    
  endfunction;

  /*BUILD PHASE */
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS", "TEST BUILD PHASE ", UVM_HIGH);
    /**/
    env = alu_env::type_id::create("ENV", this);
    
    
  endfunction: build_phase;
  /*END BUILD PHASE */

  /*CONNECT PHASE */
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST_CLASS", "TEST CONNECT PHASE ", UVM_HIGH);
    
    // connect th emonitor to scoreboard
    
    
  endfunction: connect_phase;
  /*END CONNECT PHASE */

  /*RUN PHASE */
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("TEST_CLASS", "TEST RUN PHASE ", UVM_HIGH);
    
    phase.raise_objection(this);
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agent.seq);
    
    test_seq = alu_test_sequence::type_id::create("test_seq");
    test_seq.start(env.agent.seq);
    
    
    phase.drop_objection(this);
    
    
  endtask: run_phase;
  /* END RUN PHASE */
  
endclass: alu_test
