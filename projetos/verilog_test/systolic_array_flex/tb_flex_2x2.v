`timescale 1ns/1ps

module tb_flex_2x2;
    reg clk = 1'b0;
    reg rst = 1'b1;
    reg [7:0] west_in;
    reg [7:0] north_in;
    wire done;
    wire [63:0] results;

    // A = [1 2; 3 4], B = [5 6; 7 8]
    // Resultado esperado: C = [19 22; 43 50].
    systolic_array_flex #(
        .ROWS(2), .COLS(2), .K_DIM(2), .DATA_W(4), .ACC_W(16)
    ) dut (
        .west_in(west_in), .north_in(north_in), .clk(clk), .rst(rst),
        .done(done), .results(results)
    );

    always #5 clk = ~clk;

    initial begin
        // Cada nibble e uma entrada: [3:0] = linha/coluna 0, [7:4] = 1.
        west_in  = 8'h00;
        north_in = 8'h00;
        #2 rst = 1'b0;

        // ciclo 0: A[0][0] e B[0][0]
        #1 west_in = 8'h01; north_in = 8'h05;
        // ciclo 1: A[0][1], A[1][0], B[1][0], B[0][1]
        #10 west_in = 8'h32; north_in = 8'h67;
        // ciclo 2: A[1][1], B[1][1]
        #10 west_in = 8'h40; north_in = 8'h80;
        // ciclo 3: deixa o ultimo par atravessar P11
        #10 west_in = 8'h00; north_in = 8'h00;

        @(posedge done);
        #1;
        $display("C00=%0d C01=%0d C10=%0d C11=%0d", results[15:0],
                 results[31:16], results[47:32], results[63:48]);
        if (results == {16'd50, 16'd43, 16'd22, 16'd19})
            $display("PASS");
        else
            $display("FAIL");
        $finish;
    end
endmodule
