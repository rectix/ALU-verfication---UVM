class alu_driver extends uvm_driver#(alu_sequence_item);
  `uvm_component_utils(alu_driver);
  virtual alu_interface vif;
  alu_sequence_item item;
  
  function new(string name = "alu_driver", uvm_component parent);
    super.new(name, parent);
    
    `uvm_info("DRIVER_CLASS", "CONSTRUCT DRIVER CLASS", UVM_HIGH)
    
  endfunction;

  /*BUILD PHASE */

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER_CLASS", "DRIVER BUILD PHASE ", UVM_HIGH)
    if((!uvm_config_db#(virtual alu_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("DRIVER_CLASS", "FAILED to get virtual interface from configuration DB")

    end


  endfunction: build_phase;



  /*END BUILD PHASE */

  /*CONNECT PHASE */
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("DRIVER_CLASS", "DRIVER CONNECT PHASE ", UVM_HIGH)
  endfunction: connect_phase;
  /*END CONNECT PHASE */

  /*RUN PHASE */
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("DRIVER_CLASS", "DRIVER RUN PHASE ", UVM_HIGH)
    
    //----------------------------------------------------------
    //DRIVER LOGIC
    //----------------------------------------------------------
    
    
    forever 
      begin
      item = alu_sequence_item::type_id::create("item");
        seq_item_port.get_next_item(item);
        drive(item); //<<<<<<<<<<<
        seq_item_port.item_done();
      
        
        
      end
    
    
    
  endtask: run_phase;
  /* END RUN PHASE */
  
  task drive(alu_sequence_item item);
    @(posedge vif.clock)

      vif.reset <= item.reset;
      vif.A <= item.A;
      vif.B <= item.B;
      vif.opcode<= item.opcode;


  endtask:drive;
  
endclass: alu_driver
