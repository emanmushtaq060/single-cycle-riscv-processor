`timescale 1ns/1ps

module single_cycle_top_tb;

    reg clk;
    reg rst;

    // Instantiate processor
    single_cycle dut (
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Reset and simulation control
    initial begin
        rst = 1'b0;

        // Keep reset active for 20 ns
        #20;
        rst = 1'b1;

        // Run processor
        #500;

        $finish;
    end

endmodule