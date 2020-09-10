require "prawn"

b_col = (1..15).to_a.sample(5)
i_col = (16..30).to_a.sample(5)
n_col = (31..45).to_a.sample(4)
g_col = (46..60).to_a.sample(5)
o_col = (60..75).to_a.sample(5)

def extra_space(num)
    if num < 10
        " #{num}"
    else
        "#{num}"
    end
end

bingo_card = <<-BINGO
+-----+-----+-----+-----+-----+
|  B  |  I  |  N  |  G  |  O  |
+-----+-----+-----+-----+-----+
|  #{extra_space(b_col[0])} |  #{i_col[0]} |  #{n_col[0]} |  #{g_col[0]} |  #{o_col[0]} |
+-----+-----+-----+-----+-----+
|  #{extra_space(b_col[1])} |  #{i_col[1]} |  #{n_col[1]} |  #{g_col[1]} |  #{o_col[1]} |
+-----+-----+-----+-----+-----+
|  #{extra_space(b_col[2])} |  #{i_col[2]} |  F  |  #{g_col[2]} |  #{o_col[2]} |
+-----+-----+-----+-----+-----+
|  #{extra_space(b_col[3])} |  #{i_col[3]} |  #{n_col[2]} |  #{g_col[3]} |  #{o_col[3]} |
+-----+-----+-----+-----+-----+
|  #{extra_space(b_col[4])} |  #{i_col[4]} |  #{n_col[3]} |  #{g_col[4]} |  #{o_col[4]} |
+-----+-----+-----+-----+-----+
BINGO

puts bingo_card

#puts b_col.inspect
#puts i_col.inspect
#puts n_col.inspect
#puts g_col.inspect
#puts o_col.inspect

header = ["B", "I", "N", "G", "O"]

Prawn::Document.generate("bingo.pdf") do
    define_grid(columns: 5, rows: 6)

    header.each_with_index do |char, i|
        grid(0, i).bounding_box do
            stroke_bounds
            text char, align: :center, valign: :center, size: 50, style: :bold
        end
    end
    
end
