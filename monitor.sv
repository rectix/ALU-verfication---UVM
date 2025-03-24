class alu_monitor extends uvm_monitor;
  `uvm_component_utils(alu_monitor);
  
    virtual alu_interface vif;
    alu_sequence_item item;
  uvm_analysis_port#(alu_sequence_item)  monitor_port;

  function new(string name = "alu_monitor", uvm_component parent);
    super.new(name, parent);
    
    `uvm_info("MONITOR_CLASS", "CONSTRUCT MONITOR CLASS", UVM_HIGH);
    
  endfunction;

  /*BUILD PHASE */
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR_CLASS", "MONITOR BUILD PHASE ", UVM_HIGH);
    monitor_port = new("monitor_port", this); 
    
    if((!uvm_config_db#(virtual alu_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("DRIVER_CLASS", "FAILED to get virtual interface from configuration DB");

    end

  endfunction: build_phase;
  /*END BUILD PHASE */

  /*CONNECT PHASE */
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR_CLASS", "MONITOR CONNECT PHASE ", UVM_HIGH);
  endfunction: connect_phase;
  /*END CONNECT PHASE */

  /*RUN PHASE */
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("MONITOR_CLASS", "MONITOR RUN PHASE ", UVM_HIGH);
    
    //----------------------------------------------------------
    //MONITOR LOGIC
    //----------------------------------------------------------

    
    forever begin
      item = alu_sequence_item::type_id::create("item");
        wait(!vif.reset); 
        //sample input    >>>  parallel
        @(posedge vif.clock)
        item.A <= vif.A;
        item.B <= vif.B;
        item.opcode <= vif.opcode;
        
        //sample output >>> next clock cycle
        
         @(posedge vif.clock)
        item.result<= vif.result;
        item.Carry <= vif.Carry;
       
        ///send item to scoreboard
        
        
      monitor_port.write(item);
    
		end
    
        
  endtask: run_phase;
  /* END RUN PHASE */
  
  

    
    
    

  
endclass: alu_monitor
