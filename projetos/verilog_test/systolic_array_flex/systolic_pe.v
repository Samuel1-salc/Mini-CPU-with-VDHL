// Um processing element (PE): acumula north_in * west_in e repassa os dados.
module systolic_pe #(
    parameter DATA_W = 4,
    parameter ACC_W  = 16
) (
    input  wire [DATA_W-1:0] north_in,
    input  wire [DATA_W-1:0] west_in,
    input  wire              clk,
    input  wire              rst,
    output reg  [DATA_W-1:0] south_out,
    output reg  [DATA_W-1:0] east_out,
    output reg  [ACC_W-1:0]  acc
);

    wire [2*DATA_W-1:0] product;
    assign product = north_in * west_in;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            south_out <= {DATA_W{1'b0}};
            east_out  <= {DATA_W{1'b0}};
            acc       <= {ACC_W{1'b0}};
        end else begin
            // Os dados levam um clock para chegar ao PE vizinho.
            south_out <= north_in;
            east_out  <= west_in;
            acc       <= acc + product;
        end
    end

endmodule
