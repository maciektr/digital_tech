library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity snake is 
	port(
		clk:		in std_logic;
		
		display1:	out std_logic_vector(6 downto 0) := "1111111";
		display2: 	out std_logic_vector(6 downto 0) := "1111111"
	);
end snake;

architecture arch1 of snake is 
	procedure display_phase(phase : in natural) is 
	begin
		case phase is
		--  SEG NUMBERS  		   6543210
			when 0 => display1 <= "1011000";
			when 1 => display1 <= "0011000";
			when 2 => display1 <= "0001000";
			when 3 => display1 <= "0000000";
			when 4 => display1 <= "1000000";
			when 5 => display1 <= "1100000";
			when 6 => display1 <= "1100001";			
			when 7 => display1 <= "1000010";	
			when 8 => display1 <= "0000001";
			when 9 => display1 <= "0000000";
			when 10 => display1 <= "1000000";
			when 11 => display1 <= "1010000";
			when others => display1 <= "1111111";
		end case;
		case phase is
		--  SEG NUMBERS  		   6543210
			when 0 => display2 <= "0000000";
			when 1 => display2 <= "0001000";
			when 2 => display2 <= "0001100";
			when 3 => display2 <= "1001100";
			when 4 => display2 <= "1000100";
			when 5 => display2 <= "1000000";
			when 6 => display2 <= "0000000";			
			when 7 => display2 <= "0000001";	
			when 8 => display2 <= "0000011";
			when 9 => display2 <= "1000011";
			when 10 => display2 <= "1000010";
			when 11 => display2 <= "1000000";
			when others => display2 <= "1111111";
		end case;
		 
	end procedure display_phase;
	
begin 
	
	tick : process(clk) is
	constant ITER_N : natural := 12;
	variable iteration : natural := 0;
	
	constant TICKS_PER_PHASE : natural := 10;
	variable ticks_count : natural := 0;
	begin
		if rising_edge(clk) then
			if ticks_count = 0 then
				display_phase(iteration);
				iteration := iteration + 1;
				if iteration = ITER_N then 
					iteration:= 0;
				end if;
			end if;
			ticks_count := ticks_count + 1;
			if ticks_count = TICKS_PER_PHASE then
				ticks_count := 0;
			end if;
		end if;
	end process tick;
end arch1;
