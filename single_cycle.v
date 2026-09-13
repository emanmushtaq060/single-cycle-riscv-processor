
module single_cycle (
    input clk,
    input rst
);

    wire [31:0] PC_top;
    wire [31:0] PC_next;

    wire [31:0] RD_Instruction;
    wire [31:0] Imm_Ext_top;

    wire [31:0] RD1_Top;
    wire [31:0] RD2_Top;

    wire [31:0] ALU_B;
    wire [31:0] ALUResult;

    wire [31:0] ReadData;
    wire [31:0] PCPlus4;
    wire [31:0] PCTarget;

    wire RegWrite;
    wire ALUSrc;
    wire MemWrite;
    wire ResultSrc;
    wire Branch;

    wire [1:0] ImmSrc;
    wire [2:0] ALUControl_Top;

    wire Zero;
    wire PcSrc;


    // Program Counter

    P_C PC (
        .clk(clk),
        .rst(rst),
        .PC(PC_top),
        .PC_next(PC_next)
    );


    // PC + 4

    PC_adder PC_adder (
        .a(PC_top),
        .b(32'd4),
        .c(PCPlus4)
    );


    // Instruction Memory

    instr_mem instr_mem (
        .A(PC_top),
        .rst(rst),
        .RD(RD_Instruction)
    );


    // Register File

    Reg_file Reg_file (
        .A1(RD_Instruction[19:15]),
        .A2(RD_Instruction[24:20]),
        .A3(RD_Instruction[11:7]),

        .WD3(ResultSrc ? ReadData : ALUResult),
        .WE3(RegWrite),

        .clk(clk),
        .rst(rst),

        .RD1(RD1_Top),
        .RD2(RD2_Top)
    );


    // Sign Extend

    Sign_extend Sign_extend (
        .In(RD_Instruction),
        .Imm_Ext(Imm_Ext_top),
        .ImmSrc(ImmSrc)
    );


    // ALU Input MUX

    assign ALU_B = ALUSrc ? Imm_Ext_top : RD2_Top;


    // ALU

    ALU ALU (
        .A(RD1_Top),
        .B(ALU_B),
        .ALUControl(ALUControl_Top),
        .Result(ALUResult),

        .Z(Zero),
        .N(),
        .C(),
        .V()
    );


    // Control Unit

    Control_Unit_Top Control_Unit_Top (
        .Op(RD_Instruction[6:0]),

        .RegWrite(RegWrite),
        .ImmScr(ImmSrc),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .Branch(Branch),

        .funct3(RD_Instruction[14:12]),
        .funct7(RD_Instruction[30]),

        .ALUControl(ALUControl_Top)
    );


    // Data Memory

    data_memory data_memory (
        .A(ALUResult),
        .WD(RD2_Top),
        .clk(clk),
        .WE(MemWrite),
        .RD(ReadData)
    );


    // Branch Target

    PC_adder PC_target_adder (
        .a(PC_top),
        .b(Imm_Ext_top),
        .c(PCTarget)
    );


    // PC Selection

    assign PcSrc = Branch & Zero;

    assign PC_next = PcSrc ? PCTarget : PCPlus4;


endmodule