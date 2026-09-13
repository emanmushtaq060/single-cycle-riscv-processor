module data_memory(A, WD, clk, WE, RD);

    input clk, WE;
    input [31:0] A, WD;
    output [31:0] RD;

    reg [31:0] Data_Mem [1023:0];

    // Read
    // If Write Enable is 0, read the value from memory
    assign RD = (WE == 1'b0) ? Data_Mem[A] : 32'h00000000;

    // Write
    always @(posedge clk)
    begin
        if (WE)
        begin
            Data_Mem[A] <= WD;
        end
    end

endmodule