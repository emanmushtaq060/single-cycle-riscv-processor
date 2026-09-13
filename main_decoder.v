module main_decoder(
    op,
    zero,
    RegWrite,
    MemWrite,
    ResultSrc,
    ALUSrc,
    ImmSrc,
    ALUOp,
    PcSrc
);

    input [6:0] op;
    input zero;

    output RegWrite;
    output MemWrite;
    output ResultSrc;
    output ALUSrc;
    output [1:0] ImmSrc;
    output [1:0] ALUOp;
    output PcSrc;

    // Internal wire
    wire branch;

    // RegWrite = 1 for LW and R-type instructions
    assign RegWrite = ((op == 7'b0000011) || 
                       (op == 7'b0110011)) ? 1'b1 : 1'b0;

    // MemWrite = 1 for SW
    assign MemWrite = (op == 7'b0100011) ? 1'b1 : 1'b0;

    // ResultSrc = 1 for LW
    assign ResultSrc = (op == 7'b0000011) ? 1'b1 : 1'b0;

    // ALUSrc = 1 for LW and SW
    assign ALUSrc = ((op == 7'b0000011) || 
                     (op == 7'b0100011)) ? 1'b1 : 1'b0;

    // Branch instruction
    assign branch = (op == 7'b1100011) ? 1'b1 : 1'b0;

    // Immediate source
    assign ImmSrc = (op == 7'b0100011) ? 2'b01 :
                    (op == 7'b1100011) ? 2'b10 :
                    2'b00;

    // ALU operation
    assign ALUOp = (op == 7'b0110011) ? 2'b10 :
                   (op == 7'b1100011) ? 2'b01 :
                   2'b00;

    // PC source
    assign PcSrc = zero & branch;

endmodule