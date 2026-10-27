// Array sistolico parametrizavel para A[ROWS x K_DIM] * B[K_DIM x COLS].
// west_in contem uma entrada por linha de A; north_in, uma por coluna de B.
module systolic_array_flex #(
    parameter ROWS   = 2,
    parameter COLS   = 2,
    parameter K_DIM  = 2,
    parameter DATA_W = 4,
    parameter ACC_W  = 16
) (
    input  wire [ROWS*DATA_W-1:0]           west_in,
    input  wire [COLS*DATA_W-1:0]           north_in,
    input  wire                              clk,
    input  wire                              rst,
    output reg                               done,
    output wire [ROWS*COLS*ACC_W-1:0]       results
);

    // Cada PE ocupa uma fatia dos barramentos internos.
    wire [ROWS*COLS*DATA_W-1:0] east_bus;
    wire [ROWS*COLS*DATA_W-1:0] south_bus;

    // Este contador vale para um fluxo iniciado logo apos rst ser desativado.
    // O ultimo resultado chega apos K_DIM + ROWS + COLS - 2 ciclos.
    localparam TOTAL_CYCLES = K_DIM + ROWS + COLS - 2;
    reg [15:0] cycle_count;

    genvar r, c;
    generate
        for (r = 0; r < ROWS; r = r + 1) begin : gen_rows
            for (c = 0; c < COLS; c = c + 1) begin : gen_cols
                localparam INDEX = r * COLS + c;
                wire [DATA_W-1:0] pe_west;
                wire [DATA_W-1:0] pe_north;

                // Borda oeste/topo ou saida registrada do PE vizinho.
                // Os ifs de generate evitam referencias a indices negativos
                // na primeira coluna e na primeira linha.
                if (c == 0) begin : gen_west_edge
                    assign pe_west = west_in[r*DATA_W +: DATA_W];
                end else begin : gen_west_internal
                    assign pe_west = east_bus[(INDEX-1)*DATA_W +: DATA_W];
                end

                if (r == 0) begin : gen_north_edge
                    assign pe_north = north_in[c*DATA_W +: DATA_W];
                end else begin : gen_north_internal
                    assign pe_north = south_bus[(INDEX-COLS)*DATA_W +: DATA_W];
                end

                systolic_pe #(.DATA_W(DATA_W), .ACC_W(ACC_W)) pe (
                    .north_in (pe_north),
                    .west_in  (pe_west),
                    .clk      (clk),
                    .rst      (rst),
                    .south_out(south_bus[INDEX*DATA_W +: DATA_W]),
                    .east_out (east_bus[INDEX*DATA_W +: DATA_W]),
                    .acc      (results[INDEX*ACC_W +: ACC_W])
                );
            end
        end
    endgenerate

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cycle_count <= 16'd0;
            done        <= 1'b0;
        end else if (cycle_count == TOTAL_CYCLES - 1) begin
            cycle_count <= 16'd0;
            done        <= 1'b1;
        end else begin
            cycle_count <= cycle_count + 16'd1;
            done        <= 1'b0;
        end
    end

endmodule
