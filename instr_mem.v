module instr_mem(A, rst, RD);

    input [31:0] A;
    input rst;
    output [31:0] RD;

    // Instruction memory
    reg [31:0] Mem [1023:0];

    // Load instructions into memory
    initial begin
        Mem[0] = 32'h00500093;  // addi x1, x0, 5
        Mem[1] = 32'h00A00113;  // addi x2, x0, 10
        Mem[2] = 32'h002081B3;  // add  x3, x1, x2
        Mem[3] = 32'h40110233;  // sub  x4, x2, x1
    end

    // Read instruction
    assign RD = (rst == 1'b0) ? 32'h00000000 : Mem[A[31:2]];

endmodule