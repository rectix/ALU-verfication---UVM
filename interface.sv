interface alu_interface(input logic clock);
    logic reset;

    logic [7:0] A;
    logic [7:0] B;
    logic [3:0] opcode;

    logic [7:0] result;
    bit Carry;
    

endinterface: alu_interface