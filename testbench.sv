

`timescale 1ns/1ps;


`include "uvm_macros.svh"

 import uvm_pkg::*;

/*
--------------------------------------------------------
INCLUDE FILES
--------------------------------------------------------
*/

`include "interface.sv"

`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"




`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"

`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"




/*
--------------------------------------------------------
INTANCES

SET THE INTERFACE
--------------------------------------------------------
*/



 

module top;

  
  
  logic clock;
  alu_interface intfs(.clock(clock));
  
  
  
  alu basic_alu(.clock(intfs.clock),
          .reset(intfs.reset),
          .A(intfs.A),
          .B(intfs.B), 
          .ALU_Sel(intfs.opcode),
          .ALU_Out(intfs.result),
          .CarryOut(intfs.Carry)
         
         );
  
  
            initial begin

              uvm_config_db#(virtual alu_interface)::set(null, "*","vif", intfs);
            end
  
            initial begin
              run_test("alu_test");

          end
  
    
 
          


            
          
          
         initial begin 
           clock = 0;
           #5;
           forever begin
             clock=~clock;
             #5;
           end
           
         end 
          
          
          initial begin
            #5000;
            //$diplay("TIMEOUT !!! ");
            $finish;
          end 
          
          
          //view waveforms
          
          initial begin
            $dumpfile("d.vcd");
            $dumpvars();
          end
          
          
          
  
  endmodule;