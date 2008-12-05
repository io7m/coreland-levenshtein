package body levenshtein is

  function minimum
    (a : integer;
     b : integer;
     c : integer) return integer
  is
    temp : integer := a;
  begin
    if (b < temp) then
      temp := b;
    end if;
    if (c < temp) then
      temp := c;
    end if;
    return temp;
  end minimum;
  pragma inline (minimum);

  type dist_matrix_t is
    array (natural range <>, natural range <>) of integer;

  function distance
    (s0 : string;
     s1 : string) return natural is
  begin
    if s0'length = 0 then raise constraint_error with "s0 is zero length"; end if;
    if s1'length = 0 then raise constraint_error with "s1 is zero length"; end if;

    declare
      col_min : constant natural := 0;
      col_max : constant natural := s0'length;
      row_min : constant natural := 0;
      row_max : constant natural := s1'length;

      s0_char : character;
      s1_char : character;
      cost    : integer;

      dist_matrix : dist_matrix_t (row_min .. row_max, col_min .. col_max);
    begin
      -- initialise first row
      for index in col_min .. col_max loop
        dist_matrix (row_min, index) := index;
      end loop;

      -- initialise first column
      for index in row_min .. row_max loop
        dist_matrix (index, col_min) := index;
      end loop;

      for col_index in 1 .. col_max loop
        s0_char := s0 (col_index);
        for row_index in 1 .. row_max loop
          s1_char := s1 (row_index);
  
          if s0_char = s1_char then
            cost := 0;
          else
            cost := 1;
          end if;
  
          dist_matrix (row_index, col_index) := minimum
            (a => dist_matrix (row_index - 1, col_index)     + 1,
             b => dist_matrix (row_index,     col_index - 1) + 1,
             c => dist_matrix (row_index - 1, col_index - 1) + cost);
        end loop;
      end loop;

      return dist_matrix (row_max, col_max);
    end;
  end distance;

end levenshtein;
