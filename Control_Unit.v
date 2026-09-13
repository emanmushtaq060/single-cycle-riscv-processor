`include "ALU_Decoder.v"
`include "main_decoder.v"

module Control_Unit_Top(
    Op,
    RegWrite,
    ImmScr,
    ALUSrc,
    MemWrite,
    ResultSrc,
    Branch,
    funct3,
    funct7,
    ALUControl
);

    input [6:0] Op;
    input [2:0] funct3;
    input funct7;

    output RegWrite;
    output [1:0] ImmScr;
    output ALUSrc;
    output MemWrite;
    output ResultSrc;
    output Branch;
    output [2:0] ALUControl;

    wire [1:0] ALUOp;

    main_decoder main_decoder(
        .op(Op),
        .zero(1'b0),
        .RegWrite(RegWrite),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .ALUSrc(ALUSrc),
        .ImmSrc(ImmScr),
        .ALUOp(ALUOp),
        .PcSrc()
    );

    ALU_Decoder ALU_Decoder(
        .ALUOp(ALUOp),
        .op5(Op[5]),
        .funct3(funct3),
        .funct7(funct7),
        .ALUControl(ALUControl)
    );

    assign Branch = (Op == 7'b1100011);

endmodule