module counter(
    input clk, down, rst_n,
    output reg [7:0] count
);
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n)      
            count <= 8'b0;
        else begin
            case(down)
                1'b0: count <= count + 1;
                1'b1: count <= count - 1;
            endcase
	    end
    end

endmodule
